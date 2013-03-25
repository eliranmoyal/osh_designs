class Order < ActiveRecord::Base
	attr_accessible :description, :expected_end, :percentage, :price, :state, :type
	belongs_to :user
	validates :user_id, presence: true
end
