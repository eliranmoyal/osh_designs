class Order < ActiveRecord::Base
	attr_accessible :description, :expected_end, :percentage, :price, :state, :order_type , :title
	belongs_to :user
	validates :user_id, presence: true
end
