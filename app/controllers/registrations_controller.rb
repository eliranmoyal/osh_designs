class RegistrationsController < Devise::RegistrationsController
	def destroy
	end
	def create
		super
		if !current_user.nil?
			UserMailer.register_welcome(current_user).deliver
		end
		
	end
end