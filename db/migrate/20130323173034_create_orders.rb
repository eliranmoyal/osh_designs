class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :order_type
      t.text :description
      t.string :state, :default => "unwatched"
      t.integer :price
      t.integer :percentage, :default => 0
      t.datetime :expected_end

      t.timestamps
    end
  end
end
