class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    @institutions = Institution.all
  end

  def update
    @user = User.find(params[:id])
    @user.roles = []
    @user.add_role params[:roles]

    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def confirm
    @user = User.find(params[:id])
    @user.send_confirmation_instructions
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :supervisor, :institution_id)
  end

end
