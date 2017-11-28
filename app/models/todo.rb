class Todo < ApplicationRecord

  def self.search_completed(status = true)
    Todo.where("complete = '#{status}'")
  end

  def self.update_completed(id)
    Todo.find(id).update(complete: true)
  end

end 
