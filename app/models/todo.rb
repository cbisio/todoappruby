class Todo < ApplicationRecord
    has_many :items, dependent: :destroy
    belongs_to :user
    validates :title, :created_by, presence: true

end
 