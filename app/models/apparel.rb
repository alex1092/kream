class Apparel < ApplicationRecord
    has_many :user_apparel
    has_many :users, through: :user_apparel
end
