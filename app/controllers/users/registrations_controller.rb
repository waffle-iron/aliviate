class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_account_update_params

  protected

    def update_resource(resource, configure_account_update_params)
      if(configure_account_update_params[:password] != "")
        resource.password = configure_account_update_params[:password]
        resource.password_confirmation = configure_account_update_params[:password_confirmation]
      end
      resource.update_without_password(configure_account_update_params)
    end

  private

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:id,
                                             :full_name,
                                             :email,
                                             :telephone,
                                            :cellphone,
                                            :address])
    end

end
