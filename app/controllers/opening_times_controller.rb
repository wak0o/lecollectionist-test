class OpeningTimesController < ApplicationController
  before_action :set_opening_time, only: [:edit, :update, :destroy]
  before_action :set_shop, only: [:create, :destroy]

  def new
    @opening_time = OpeningTime.new
  end

  def create
    @opening_time = OpeningTime.new(opening_time_params)
    @opening_time.shop = @shop
    if @opening_time.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @opening_time.update(opening_time_params)
      redirect_to shop_path(@opening_time.shop)
    else
      render :edit
    end
  end

  def destroy
    @opening_time.destroy
    redirect_to shop_path(@shop)
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_opening_time
    @opening_time = OpeningTime.find(params[:id])
  end

  def opening_time_params
    params.require(:opening_time).permit(:open_at, :close_at, :week_day)
  end
end
