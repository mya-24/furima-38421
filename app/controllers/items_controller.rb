class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # def index
  #   @items = Item.all
  # end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_item)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def edit
  #   @item = Item.find(params[:id])
  # end

  # def show
  #   @item = Item.find(params[:id])
  # end

  private

  def create_item
    params.require(:item).permit(:item_name, :description, :image, :price, :category_id, :condition_id, :costperson_id, :prefecture_id, :prepareday_id).merge(user_id: current_user.id)
  end

end
