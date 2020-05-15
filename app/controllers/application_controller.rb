class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    before_action :authenticate_user!, except: %i['pages#index']

    protect_from_forgery with: :exception
    
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :phone, :dob])
    end
  end