class CreateDeliveryInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_infos do |t|

      t.timestamps
    end
  end
end
