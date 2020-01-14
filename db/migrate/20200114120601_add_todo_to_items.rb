class AddTodoToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :todo, foreign_key: true
  end
end
