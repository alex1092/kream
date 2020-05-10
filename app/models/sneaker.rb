class Sneaker < ApplicationRecord
    has_many :user_sneakers
    has_many :users, through: :user_sneaker
    has_one_attached :picture
end
