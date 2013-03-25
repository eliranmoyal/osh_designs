class UsersController < ApplicationController
	before_filter :authenticate_user! 
	def show
		begin
			@user = User.find(params[:id])
			@orders = @user.orders
		rescue ActiveRecord::RecordNotFound  
			redirect_to root_path , :alert => "No Such User"
			return
		end
	end
end
