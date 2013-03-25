require 'spec_helper'

describe Order do
    let(:user) { FactoryGirl.create(:user) }
  before { @order = user.orders.build(description: "Lorem ipsum",expected_end: Time.now,
  	percentage:0 , price:30 , state:"orderd" ,type:"logo") }

  subject { @order }

  it { should respond_to(:description) }
  it { should respond_to(:expected_end) }
  it { should respond_to(:percentage) }
  it { should respond_to(:price) }
  it { should respond_to(:state) }
  it { should respond_to(:type) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }


  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Order.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @order.user_id = nil }
    it { should_not be_valid }
  end

# need to add validations here when they accure

end
