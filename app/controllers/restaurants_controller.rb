class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    unless current_user
      flash[:alert] = ["You must be logged in to add a restaurant!"]
      redirect_to root_path
      return
    end
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path
    else
      redirect_to new_restaurant_path
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    unless current_user
      flash[:alert] = ["You must be logged in to edit this restaurant!"]
      redirect_to root_path
      return
    end

    require_ownership_or_role

    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      flash.now[:alert] = @restaurants.errors.full_messages
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end


  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :url, :capacity, :open_time, :close_time, :price_range, :neighbourhood, :summary)
  end

  private

  def require_ownership_or_role
    unless User::ALLOWED_ROLES.include?(current_user.role)
      unless current_user.restaurants.include?(@restaurant)
        flash[:alert] = ["You must be the owner of this resturatnt to make changes!"]
      end
    end
  end
end
