require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    before do
      get 'home'
    end
    it "returns http success" do
      response.should be_success
    end

    it "should contain " do
      page.should have selector('a>h2', :text => 'ArtiPixel')
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

end
