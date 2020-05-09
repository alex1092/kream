class Sneaker < ApplicationRecord
    has_many :user_sneakers
    has_many :users, through: :user_sneaker
end
