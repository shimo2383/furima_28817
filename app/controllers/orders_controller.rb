class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  #ログインしていないユーザーをログインページの画面に促すことができます。

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id  ||  @item.order != nil 
      redirect_to root_path
    end
  end

  def create
  end

end