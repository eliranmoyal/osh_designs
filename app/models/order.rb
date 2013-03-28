class Order < ActiveRecord::Base
	attr_accessible :description, :expected_end, :percentage, :price, :state, :order_type , :title
	belongs_to :user
	validates :user_id, presence: true

	 default_scope order: 'orders.created_at'
	 scope :in_progress  , where("orders.state ='in progress' ")
	 scope :unwatched  , where("orders.state ='unwatched' ")
end
