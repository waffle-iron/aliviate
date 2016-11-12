class UsersController < ApplicationController

  # Callbacks

  before_action :validate_user

  # Methods

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(permit_params)
      flash[:success]= t('successful_update')
      redirect_to edit_user_url(@user)
    else
      flash[:error]= t('verify_data')
      redirect_to edit_user_url(@user)
    end
  end

  private

    def permit_params
    params.require(:user).permit(:full_name, :email, :telephone,
                                 :cellphone, :address)

    end

    def validate_user
      redirect_to root_url unless current_user and current_user.id == params[:id].to_i
    end
end
