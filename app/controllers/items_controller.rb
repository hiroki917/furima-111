class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :shipping_charge_id, :area_id, :day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
