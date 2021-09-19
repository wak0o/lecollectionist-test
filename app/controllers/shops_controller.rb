class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    @shops = Shop.all
  end

  def show
  end

  def new
    @shop = Shop.new
    @shop.opening_times.build
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_path
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(
      :name,
      opening_times_attributes: [:id, :open_at, :close_at, :week_day, :_destroy]
    )
  end

end