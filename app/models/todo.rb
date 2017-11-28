class Todo < ApplicationRecord

  def self.search_completed(status = true)
    Todo.where("complete = '#{status}'")
  end

  def self.update_completed(id)
    Todo.find(id).update(complete: true)
  end

  def self.progress_bar
    completed = Todo.where("complete = 'true'").count.to_f
    total = Todo.all.count

    (completed / total) * 100
  end
end
