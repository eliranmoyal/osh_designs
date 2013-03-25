require 'spec_helper'

describe UsersController do

let(:user) { FactoryGirl.create(:user) }
let(:order1) { FactoryGirl.create(:order , user: user) }
  
  describe "GET 'show'" do
    before { visit user_path(user) }
    
    it "returns http success" do
      response.should be_success
    end
    describe "orders" do
       it { should have_content(order1.description) }
    end
  end

end
