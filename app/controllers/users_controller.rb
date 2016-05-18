class UsersController < ApplicationController
  before_action :authenticate_user!, unless: -> {request.xhr?}

  def index
    @users = User.all
  end

  def show
    if request.xhr?
      @users = list_supervidors params[:id]
      render :partial => 'users_select', :object => @users
    else
      @user = User.find(params[:id])
    end
  end

  def edit
    @user = User.find(params[:id])
    @institutions = Institution.all
    if @user.is_pesquisador?
      @supervisors = list_supervidors @user.institution_id
    else
      @supervisors = []
    end
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

  def lock
    @user = User.find(params[:id])
    @user.lock_access!
    redirect_to users_path
  end

  def unlock
    @user = User.find(params[:id])
    @user.unlock_access!
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :supervisor, :institution_id, :roles, :supervisor_id)
  end

  def list_supervidors institution_id
    User.where({institution_id: institution_id, roles: 2})
  end

end
