ActiveAdmin.register Order do
	# add filters
	filter :state  , :as => :select , :collection => ["unwatched","in progress"]

# add scopes
scope :all, :default => true
scope :unwatched
scope :in_progress

 # member_action :lock, :method => :put do
 #      user = User.find(params[:id])
 #      user.lock!
 #      redirect_to {:action => :show}, :notice => "Locked!"
 #    end


#override controller
controller do
      # This code is evaluated within the controller class

      def create
      	@order = Order.new
      	@order.accessible = :all 
      	@order.attributes = params[:order]
      	if @order.save
      		redirect_to admin_orders_path 
      	else
      		redirect_to root_url
      	end
      end
  end

  form do |f|
  	f.inputs "Details" do
  		if f.object.new_record?
  			f.input :user
  			f.input :title
  			f.input :order_type 
  			f.input :description 

  		end
  		f.input :state , :collection =>  ["unwatched","in progress"]
  		f.input :expected_end ,:label => "When Will I Finish It" , :as => :date_select
  		f.input :percentage
  		f.input :price
  	end
  	f.buttons
  end

end
