class Sell < ApplicationRecord
  belongs_to :user
  has_many :sneaker
  has_many :apparel
end
