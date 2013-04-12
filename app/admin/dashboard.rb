ActiveAdmin.register_page "Dashboard" do

   menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title =>"Dashboard"  do



      columns do 


        column do
            panel "" do
                div :class => "dash" do
                  render 'admins/order_chart'
              end #ends div
          end #ends panel
      end #ends column

column do
    panel "5 Recent Orders" do
        table_for Order.order('created_at desc').limit(5) do |order|
            column("title") {|order| link_to(order.title, admin_order_path(order))}
             column("state")   {|order| status_tag(order.state)     }
             column("client"){|order| link_to(order.user.name, admin_user_path(order.user)) } 
            column("price")   {|order| number_to_currency order.price    , :unit =>  "&#8362;"} 
        end
    end
end



     #  column do
     #    panel "Recent Orders" do
     #       table_for Order.order('id desc').limit(10) do |order|
     #         column("state")   {|order| status_tag(order.state)     
     #         end #ends table
     #     end #ends panel
     # end #ends column


 end #ends columns
      #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end
    

end #ends content
end #ends 
