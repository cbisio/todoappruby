class Todo < ApplicationRecord
    has_many :tasks, dependent: :destroy
    belongs_to :user
    validates :title, :created_by, presence: true

end
 