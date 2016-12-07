class UsersController < ApplicationController

  # Callbacks

  before_action :validate_user
<<<<<<< HEAD
  before_action :edit, only: [:update, :edit]

=======
>>>>>>> 5895a0334a419d985270980a7af326eff702c8cb

  # Methods

  def show
    @user = User.find(params[:id])
  end

<<<<<<< HEAD
  def update
    if @user.update(permit_params)
=======
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(permit_params)
>>>>>>> 5895a0334a419d985270980a7af326eff702c8cb
      flash[:success] = t('successful_update')
      redirect_to edit_user_url(@user)
    else
      flash[:error] = t('verify_data')
      redirect_to edit_user_url(@user)
    end
  end

  private

<<<<<<< HEAD
    def edit
      @user = User.find(params[:id])
    end

=======
>>>>>>> 5895a0334a419d985270980a7af326eff702c8cb
    def permit_params
    params.require(:user).permit(:full_name, :email, :telephone,
                                 :cellphone, :address)

    end

    def validate_user
      redirect_to root_url unless current_user and current_user.id == params[:id].to_i
    end
end
