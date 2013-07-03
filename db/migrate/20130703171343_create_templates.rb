class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.integer :category_id
      t.string :title

      t.timestamps
    end
  end
end
