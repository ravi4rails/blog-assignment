class UsersController < ApplicationController

  load_and_authorize_resource

  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_user, only: [:destroy, :change_role, :update_role]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, flash: { success: "User has been created successfully" }
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, flash: { success: "User has been destroyed successfully" }
  end

  def change_role
  end

  def update_role
    @user.update(user_role_param)
    redirect_to users_path, flash: { success: "Role for #{@user.name} has been changed successfully" }
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit!
    end

    def user_role_param
      params.require(:user).permit(:role)
    end

end
