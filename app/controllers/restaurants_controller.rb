class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # grab the data from params (sent by form)
    # create a new instance of restaurant
    @restaurant = Restaurant.new(restaurant_params)
    # save it to database
    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new
    end
    
    # redirect to the newly created restaurant
  end

  def edit
  end

  def update
    # PATCH
    # update with new data
    
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant.id)
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :rating, :address)
  end
end
