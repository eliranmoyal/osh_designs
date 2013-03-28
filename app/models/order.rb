class Order < ActiveRecord::Base

	attr_accessible :description, :expected_end, :percentage, :price, :state, :order_type , :title
	belongs_to :user
	validates :user_id, presence: true
	attr_accessor :accessible
	default_scope order: 'orders.created_at'
	scope :in_progress  , where("orders.state ='in progress' ")
	scope :unwatched  , where("orders.state ='unwatched' ")

	private

		def mass_assignment_authorizer(role = :default)
			if accessible == :all
				self.class.protected_attributes
			else
				super + (accessible || [])
			end
		end
end
