class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.all.order(created_at: :DESC)
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

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
    @purchases = Purchases.new
    @purchases = @purchases.includes(:user)
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :product_id, :shipping_id, :prefecture_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
