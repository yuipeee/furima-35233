class OrdersController < ApplicationController
  def index
    @order_shipping = OrderShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_shipping.valid?
      Payjp.api_key = "sk_test_b3cf28cc9f8f20a7aa3ba922" 
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

  def order_params
    params.require(:order_shipping).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
