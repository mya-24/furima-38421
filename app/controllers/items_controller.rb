class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update] #, :destroy]
  before_action :find_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order("created_at desc")
  end
  
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

  def edit
    if current_user.id != @item.user.id #|| (商品が売却済みなら)
      redirect_to root_path
    end
  end

  def update
    if @item.update(create_item)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def show
  end

  private

  def create_item
    params.require(:item).permit(:item_name, :description, :image, :price, :category_id, :condition_id, :costperson_id, :prefecture_id, :prepareday_id).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
