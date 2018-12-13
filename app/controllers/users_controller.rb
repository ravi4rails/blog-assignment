class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :update, :edit, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), flash: { success: "User has been created successfully" }
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), flash: { success: "User has been updated successfully" }
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, flash: { success: "User has been destroyed successfully" }
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit!
    end

end
