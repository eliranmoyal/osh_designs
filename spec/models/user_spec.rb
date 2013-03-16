require 'spec_helper'

describe User do
	describe "users attrirbutes" do
		before do
			@user = User.new
		end

		it "should respond to phone" do
			@user.should respond_to(:phone)
		end
		
	end
end