
class UserMailer < ActionMailer::Base
  require "open-uri"
  default from: "artipixelsite@gmail.com"

  def register_welcome(user)
	@user= user
	 mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

  def annonce_admin_on_order(order)
  	@order = order
  	mail(:to => AdminUser.first.email , :subject => "New Order From #{order.user.name} ")
  end

  def annonce_user_on_order_complete(order)
  	@order = order
  	attachments["#{@order.title}.#{@order.image_url.split(".").last}"] = open(order.image_url).read
  	mail(:to => @order.user.email , :subject => "Your Order \"#{@order.title}\"  has been submitted")
  end

end
