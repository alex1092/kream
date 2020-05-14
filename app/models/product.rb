class Product < ApplicationRecord
    belongs_to :user
    has_one_attached :picture
    validates :category, :brand, :style, :size, :price, :picture, presence: true
end
