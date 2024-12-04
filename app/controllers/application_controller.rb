class ApplicationController < ActionController::Base
    #configure_permitted_parameters: method runs before each Devise controller action.
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        user_path(current_user)
    end

    def after_sign_in_path_up(resource)
        user_path(current_user)
    end
     
    #protected methods in class
    protected
     
    #override configure_permitted_parameters method to allow additional parameters
    #by default devise only allows email, password and password_confirmation
    def configure_permitted_parameters
        # parameters allowed during sign up
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
        # parameters that can be updated
        devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end
      
end
