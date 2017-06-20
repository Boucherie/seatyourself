class UsersController < ApplicationController

  before_action :find_user, only: %i(edit update)

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new
    end
  end

  def show
    unless current_user
      flash[:alert] = ["Must be logged in to view this account!"]
      redirect_to root_path
      return
    end
    @user = User.find(params[:id])

    require_ownership_or_role
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

    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "Info Updated"
      redirect_to root_url
    else
      flash.now[:error] = "You must be logged in!"
      render :edit
    end
  end

  def user_params
    { email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation]}
  end

private

  def find_user
    @user = current_user
  end

  def require_ownership_or_role
    unless User::ALLOWED_ROLES.include?(current_user.role)
      unless current_user.restaurants.include?(@user)
        flash[:alert] = ["This must be your account to make changes!"]
      end
    end
  end

end
