class Apparel < ApplicationRecord
    has_many :user_apparel
    has_many :users, through: :user_apparel
    has_one_attached :picture
end
