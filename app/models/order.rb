class Order

  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :user_id, :item_id, :address_postcode, :prefecture_id, :address_cho, :address_other, :address_building, :tel_number, :purchaselog_id

  validates :user_id,           presence: true
  validates :item_id,           presence: true
  validates :address_postcode,  presence: true, format: { with: /\A[\d]{3}-[\d]{4}\z/, message: 'is invalid. Enter it as follows (e.g. XXX-XXXX)'}
  validates :prefecture_id,     presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :address_cho,       presence: true
  validates :address_other,     presence: true
  validates :tel_number,        presence: true, format: { with: /\A\d{10,11}\z/, message: 'must be 10-11 digits number(NOT enter "-")'}

  def save
    # DeliveryInfoのpurchase_idに使用するため変数化
    purchaselog = PurchaseLog.create(user_id: user_id, item_id: item_id)
    DeliveryInfo.create(purchase_log_id: purchaselog.id, address_postcode: address_postcode, prefecture_id: prefecture_id, address_cho: address_cho, address_other: address_other, address_building: address_building, tel_number: tel_number)
  end

end