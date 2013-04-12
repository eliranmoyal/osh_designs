class Order < ActiveRecord::Base

	attr_accessible :description, :expected_end, :percentage, :price, :state, :order_type , :title
	belongs_to :user
	validates :user_id, presence: true
	attr_accessor :accessible
	default_scope order: 'orders.created_at'
	scope :in_progress  , where("orders.state ='in progress' ")
	scope :unwatched  , where("orders.state ='unwatched' ")
	scope :completed  , where("orders.state ='completed' ")
	scope :paid  , where("orders.state ='paid' ")
	scope :unpaid , where("orders.state !='paid' ")


	def self.total_on(date)
		where("date(created_at) = ?",date).sum(:price)
	end

	private

	def mass_assignment_authorizer(role = :default)
		if accessible == :all
			self.class.protected_attributes
		else
			super + (accessible || [])
		end
	end
end
