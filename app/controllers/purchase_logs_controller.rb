class PurchaseLogsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @item = Item.find(params[:item_id])

    #売却済みリスト
    sold_items = []
    solds = PurchaseLog.all

    solds.each do |sold|
      sold_items << sold.item_id
    end

    #ログインユーザーと出品者が等しくない　かつ　今回のアイテムが売却済みリストにない
    if current_user.id != @item.user.id && !sold_items.include?(@item.id)
      @purchaselog = Order.new
    else
      redirect_to root_path
    end
  end

  def new
    @purchaselog = Order.new
  end

  def create
    @purchaselog = Order.new(new_purchaselog)
    if @purchaselog.valid?
      @purchaselog.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def new_purchaselog
    item = Item.find(params[:item_id])
    params.require(:order).permit(:address_postcode, :prefecture_id, :address_cho, :address_other, :address_building, :tel_number).merge(user_id: current_user.id, item_id: item.id)
  end

end
