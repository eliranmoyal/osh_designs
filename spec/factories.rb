FactoryGirl.define do
	factory :user do
		sequence(:name)  { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com"}   
		password "password2"
		password_confirmation "password2"
	end
	factory :facebook_user do
		name "facebook user"
		email "user@facebook.com"
		provider "facebook"
		uid "123456"
		password ""
	end

	factory :order do
		description "test order"
		expected_end Time.now+1.day
		percentage 0
		price 30 
		state"orderd" 
		type "logo"
		user
	end
end