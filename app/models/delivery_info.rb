class DeliveryInfo < ApplicationRecord
  belongs_to :purchase_log
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
