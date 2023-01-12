class PurchaseLogsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :find_item, only: [:index, :create]

  def index
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
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,             # 商品の値段
        card: @purchaselog.token,       # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchaselog.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def new_purchaselog
    params.require(:order).permit(:address_postcode, :prefecture_id, :address_cho, :address_other, :address_building, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

end
