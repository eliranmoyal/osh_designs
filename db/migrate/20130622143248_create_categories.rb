class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :min_price
      t.integer :max_price
      t.integer :min_days_work
      t.integer :max_days_work
      
      t.timestamps
    end
  end
end
