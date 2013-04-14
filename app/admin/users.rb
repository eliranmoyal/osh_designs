ActiveAdmin.register User do

	config.batch_actions = true

	filter :name
	filter :email
	filter :created_at

	index do
		selectable_column
		column "Name" , :sortable => :name do |user|
			link_to user.name , admin_user_path(user)
		end
		column :email
		column :phone
		
		column "facebook link" do |user|
			if !(user.uid.nil? || user.uid.blank?)
				link_to user.name, "http://www.facebook.com/#{user.uid}"
			else
				"not via facebook"
			end
		end
		column "Number Of Orders"   do |user|
			user.orders.count
		end
		column "In Debt Of" do |user|
			sum_not_paid = user.orders.select{|order| order.state != "paid" && order.price !=nil}
							.sum{|order| order.price}

			number_to_currency sum_not_paid, :unit =>  "&#8362;"	
		end
		column "Joined At " , :created_at
		default_actions
	end

	show :title => :name do
		panel "Orders" do
			table_for(user.orders) do
				column :id 
				column("Order", :sortable => :title) {|order| link_to "#{order.title}", admin_order_path(order) }
				column("State")                   {|order| status_tag(order.state) }
				column("Date Orderd" , :created_at,:sortable =>:created_at) 
				# column("Date", :sortable => :checked_out_at){|order| pretty_format(order.checked_out_at) }
				column("Price")                   {|order| number_to_currency order.price , :unit =>  "&#8362;"}
			end
		end
		active_admin_comments
	end

	sidebar "Customer Details", :only => :show do
		attributes_table_for user do 
			row("Name") {user.name}
			row("Email") {user.email}
			row("Phone") {user.phone}
			if user.provider == "facebook"
				row("Facebook") {link_to user.name, "http://www.facebook.com/#{user.uid}"}
			end
		end
	end

	sidebar "Order History", :only => :show do
		attributes_table_for user do
			last_order =   user.orders.sort_by{|x| x.created_at}.first
			row("Last Order") {link_to  last_order.title , admin_order_path(last_order)}
			row("Total Orders") { user.orders.count }
			row("Total Value") { number_to_currency user.orders.sum(:price)  , :unit =>  "&#8362;"}
		end
	end

end
