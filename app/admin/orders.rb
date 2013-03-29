ActiveAdmin.register Order do
	# add filters
	filter :state  , :as => :select , :collection => ["unwatched","in progress"]

# add scopes
scope :all, :default => true
scope :unwatched
scope :in_progress

 member_action :change, :method => :post do
      order = Order.find(params[:id])
      File.open("test.text", "w") { |file| file.puts params.inspect  }
      order.update_attributes(params[:order])
      redirect_to admin_orders_path
    end

    index do
    	column :title
    	column :id
    	column :state
    	column "ordered by" do |order|
    		order.user.name
    	end
    	column "Actions" do |order|
		render  'admins/order_actions' , :order => order
    	end
    	
    end

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
      def update
      	@order = Order.find(params[:id])
      	@order.update_attributes(params[:order])
      	redirect_to admin_orders_path 
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
