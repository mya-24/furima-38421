class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category
  belongs_to :Condition
  belongs_to :Costperson
  belongs_to :Prefecture
  belongs_to :Prepareday

  #バリデーション
  validates :item_name,   presence: true
  validates :description, presence: true
  validates :price,       presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  validates :image, presence: true, unless: :was_at?

  validates :category_id,     numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id,    numericality: { other_than: 0, message: "can't be blank" }
  validates :costperson_id,   numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id,   numericality: { other_than: 0, message: "can't be blank" }
  validates :prepareday_id,   numericality: { other_than: 0, message: "can't be blank" }

  belongs_to :user
  has_one :purchase_log
  
  has_one_attached :image

  def was_at?
    self.image.attached?
  end

end
