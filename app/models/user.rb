class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :apparels
  has_many :sneakers
  validates :f_name, :l_name, :phone, :dob, :user_name, presence: true
end
