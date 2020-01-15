class User < ApplicationRecord

    has_many :todos
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
end
