class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  # end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :product_id, :shipping_id, :prefecture_id, :days_id, :price).merge(user_id: current_user.id)
  end
  #  params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
end
