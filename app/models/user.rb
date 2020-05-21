class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #This is created with the devise gem
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
        #  This is making it possible to log in through facebook 
         :omniauthable, omniauth_providers: [:facebook]

  #  Connecting user to products 
  has_many :products

  #Method for oauth it is calling the email password and name from facebook
  def self.from_omniauth(auth)
    puts auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   
    end
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
end
