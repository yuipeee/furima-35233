class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :help_order, only: [:index, :create]

  def index
    @order_shipping = OrderShipping.new
    if current_user || @item.order.present?
    redirect_to root_path
    end
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'               
      )
       @order_shipping.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def help_order
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shipping).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end