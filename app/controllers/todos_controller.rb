class TodosController < ApplicationController
  before_action :find_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all
  end

  def show
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render 'edit'
    end
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  def check_complete
    Todo.update_completed(params[:id])
    # Todo.find(params[:id]).update(complete: true)
    redirect_to todos_path
  end

  def completed
    @todos = Todo.search_completed
    render 'index'
  end

  def not_completed
    @todos = Todo.search_completed(false)
    render 'index'
  end


  private

    def todo_params
      params.require(:todo).permit(:title, :description, :complete, :priority)
    end

    def find_todo
      @todo = Todo.find(params[:id])
    end
end
