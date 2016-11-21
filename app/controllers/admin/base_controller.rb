class Admin::BaseController < ApplicationController

  # Callbacks

  before_action :authenticate_user!
  before_action :is_user_admin

  layout 'admin'

  # Methods

  private

    def is_user_admin
      redirect_to root_path unless current_user.is_admin?
    end

end
