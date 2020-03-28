class ItemsController < ApplicationController
# move_to_indexが実行されるのはindexアクション以外
  before_action :move_to_index, except: :index


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  # deviseを導入しているためcurrent_userメソッドが利用可能
  def create
    Item.create(name: item_params[:name], price: item_params[:price],
      user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private
    def item_params
      params.require(:item).permit(:name, :price)
    end
end