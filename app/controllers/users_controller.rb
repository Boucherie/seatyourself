class UsersController < ApplicationController

  before_action :find_user, only: %i(edit update)

  def new
    @user = User.new
  end

  def create
    @user.user_params
    @user = User.new(user_params)
    if @user.save
      redirect_to "/restaurants"
    else
      render :new
    end
  end

  def edit
    unless @user
      flash[:error] = "You must be logged in!"
      redirect_to root_url
    end
  end

  def update
    unless @user
      flash[:error] = "You must be logged in!"
      redirect_to root_url and return
    end

    @user.user_params

    if @user.save
      flash[:notice] = "Info Updated"
      redirect_to root_url
    else
      flash.now[:error] = "You must be logged in!"
      render :edit
    end
  end

private

  def find_user
    @user = current_user
  end

  def user_params
    (params.require(:user).permit(:email, :passoword, :password_confirmation)
  end
end
