FactoryGirl.define do
	factory :user do
		sequence(:name)  { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com"}   
		password "foobar"
		password_confirmation "foobar"
	end
	factory :facebook_user do
		name "facebook user"
		email "user@facebook.com"
		provider "facebook"
		uid "123456"
		password ""
	end
end