class RegistrationsController < Devise::RegistrationsController
	def destroy
	end
	def create
		super
		UserMailer.register_welcome(current_user).deliver
	end
end