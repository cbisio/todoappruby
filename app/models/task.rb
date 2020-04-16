class Task < ApplicationRecord
  belongs_to :todo
  validates :name, :done, presence: true
end
