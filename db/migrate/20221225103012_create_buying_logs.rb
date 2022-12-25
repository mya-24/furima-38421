class CreateBuyingLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :buying_logs do |t|

      t.timestamps
    end
  end
end
