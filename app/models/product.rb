class Product < ApplicationRecord

    # Connecting to user and attaching a picture, also validating several things for the product 
    belongs_to :user
    has_one_attached :picture
    validates :category, :brand, :style, :size, :price, :picture, presence: true


    include PgSearch::Model
    pg_search_scope :search_by_product, against: [:style, :brand], using: {
        tsearch: { prefix: true }
      }

end
