require 'spec_helper'

describe User do
	
	before { @user = User.new(name: "Example User",
		email: "user@example.com", 
		password: "foobarbaz", 
		password_confirmation: "foobarbaz" ,
		phone: "")}
	
	subject { @user }
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:phone) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:remember_me) }
	it { should respond_to(:provider) }
	it { should respond_to(:uid) }

	it { should be_valid }
	
	describe "when name is not present" do
		before { @user.name = "" }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				@user.should_not be_valid
			end      
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				@user.should be_valid
			end      
		end
	end

	describe "when phone format is invalid" do
		it "should be invalid" do
			phones = %w[1234  009-1234567  0601234567 001234567]
			phones.each do |bad_phone|
				@user.phone = bad_phone
				@user.should_not be_valid
			end  
		end
	end

	describe "when phone format is valid" do
		it "should be valid" do
			phones = %w[081234567 08-1234567 0501234567 0551234567 055-1234567]
			phones.each do |valid_phone|
				@user.phone = valid_phone
				@user.should be_valid
			end
		end
		
	end




end