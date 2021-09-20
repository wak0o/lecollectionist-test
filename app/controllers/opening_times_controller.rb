class OpeningTimesController < ApplicationController
  before_action :set_opening_time, only: [:destroy]
  before_action :set_shop, only: [:create]

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

  def destroy
    @opening_time.destroy
    redirect_to shop_path(@opening_time.shop)
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_opening_time
    @opening_time = OpeningTime.find(params[:shop_id])
  end

  def opening_time_params
    params.require(:opening_time).permit(:open_at, :close_at, :week_day)
  end
end
