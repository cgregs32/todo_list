class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.boolean :complete, default: false
      t.string :priority

      t.timestamps
    end
  end
end
