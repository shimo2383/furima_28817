class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    #@item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :product_status_id,
                                 :shipping_charges_id, :shipping_region_id, :shipping_date_id, :description, :name, :price).merge(user_id: current_user.id)
  end
end
