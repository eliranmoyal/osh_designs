ActiveAdmin.register Order do
	# add filters
  
  def order_types
    ["Logo","Banner", "Web Site"]
  end

	filter :order_type  , :as => :select , :collection => order_types
  filter :price 
  filter :percentage
  filter :expected_end
  filter :title

# add scopes
scope :all, :default => true
scope :unwatched
scope :in_progress


    index do
      column :id 
    	
      column "Title" , :sortable => :title do |order|
        link_to order.title , resource_path(order) 
      end

    	column :order_type
    	column :state
      column "Price" ,:sortable => :price do |order|
        number_to_currency order.price , :unit =>  "&#8362;"
      end
      column "Progress" , :sortable => :percentage do |order|
        "#{order.percentage}%"
      end
      column "Estimated Finshed",:expected_end
    	column "ordered by" , :sortable => :user_id do |order|
    		link_to order.user.name, resource_path(order.user)
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
