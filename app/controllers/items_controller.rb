class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :help_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
    current_user.id == @item.user_id
    redirect_to root_path 
  end

  def update
    if @item.update(item_params)
      redirect_to item_path 
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def help_item
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_cost_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
