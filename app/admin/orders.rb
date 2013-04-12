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
scope :completed
scope :paid


index do
  column :id 

column "Order Date" ,:sortable => :created_at do |order|
  order.created_at.strftime(" %d/%m/%Y")
end

  column "Title" , :sortable => :title do |order|
    link_to order.title , resource_path(order) 
  end

  column :order_type
  column "State" , :sortable => :state do |order|
      status_tag(order.state)
  end
  column "Price" ,:sortable => :price do |order|
    number_to_currency order.price , :unit =>  "&#8362;"
  end
  column "Progress" , :sortable => :percentage do |order|
    "#{order.percentage}%"
  end
  column "Estimated Finsh",:sortable => :expected_end do |order|
    if order.expected_end.nil?
      nil
    else
    order.expected_end.strftime(" %d/%m/%Y")  
    end
    
  end

  column "ordered by" , :sortable => :user_id do |order|
    link_to order.user.name, admin_user_path(order.user)
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
       f.input :order_type , :as => :select,      :collection => order_types
       f.input :description 

     end
     f.input :state , :collection =>  ["unwatched","in progress","completed","paid"]
     f.input :expected_end ,:label => "When Will I Finish It" , :as => :date_select
     f.input :percentage
     f.input :price
   end
   f.buttons
 end

 show :title => :title do
  panel "Order Details" do
   attributes_table_for order do
     # row :id
     row :title
     row("Ordered By ") {link_to order.user.name, admin_user_path(order.user)}
     row("State") {status_tag(order.state) }
     row ("Percentage") {"#{order.percentage}%"}
     row ("Price") { number_to_currency order.price , :unit =>  "&#8362;" }
     row ("Estimated Finish") {order.expected_end}
     row ("Orderd At") {order.created_at}
     row :updated_at
     row :description


   end
 end
 active_admin_comments
end


end
