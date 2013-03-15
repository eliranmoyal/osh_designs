class AddIndexToUsersProvider < ActiveRecord::Migration
  def change
  	add_index :users, :provider 
  end
end
