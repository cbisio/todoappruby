class Task < ApplicationRecord
  belongs_to :todo

  validates :name, :done, :todo_id, presence: true
end
