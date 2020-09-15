class OrdersController < ApplicationController

  def index
    if user_signed_in?
      @item = Item.find(params[:item_id])
    else
      redirect_to user_session_path
    end
  end

  def create
  end
  
end
