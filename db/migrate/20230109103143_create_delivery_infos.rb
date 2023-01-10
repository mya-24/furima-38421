class CreateDeliveryInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_infos do |t|

      t.references  :purchase_log,       null: false, foreign_key: true 
      t.string      :address_postcode,   null: false
      t.integer     :prefecture_id,      null: false
      t.string      :address_cho,        null: false
      t.string      :address_other,      null: false
      t.string      :address_building
      t.string      :tel_number,         null: false
      t.timestamps
    end
  end
end
