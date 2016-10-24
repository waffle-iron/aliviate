class ApplicationController < ActionController::Base

  # Protect_from_forgery will be delete with SSL

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:email, :password, :password_confirmation,
                           :full_name, :telephone, :cellphone,
                           :address, :is_admin)
      end
    end

end
