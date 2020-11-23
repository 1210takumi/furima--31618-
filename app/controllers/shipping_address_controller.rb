class ShippingAddressController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @shipping_order = ShippingOrder.new 
  end

  def create
    @shipping_order = ShippingOrder.new(shipping_order_params)   #「UserDonation」に編集
    # @shipping_order.valid? => true or false
    # if false? => @shipping_order.errors.full_messages
    # エラーの原因がわかるのでそれをみてくださ合い！
    @item = Item.find(params[:item_id])
    if @shipping_order.valid?
      pay_item
      @shipping_order.save
      return  redirect_to root_path
    end
    render 'index'
  end

 private

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: params[:card_token],
    currency: 'jpy' 
   )
  end


  def shipping_order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :phone_number, :building_name, :user_id, :card_token, :item_id).merge(user_id: current_user.id)
  end
end


