require 'spec_helper'

describe StoreController do

  attr_reader :store_access_count
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "assigns the products" do
      product = create(:product)
      get 'index'
      assigns(:products).should eq([product])
    end

    it "orders the products by title" do
      last = create(:product, title: "Zen Ruby")
      first = create(:product, title: "A Day in Ruby")
      middle = create(:product, title: "Boy I Like Ruby")
      get 'index'
      assigns(:products).should eq([first, middle, last])
    end

    it "counts the number of times the index action is hit" do
      get 'index'
      assigns(:store_access_count).should == 1
      get 'index'
      assigns(:store_access_count).should == 2
    end

    it "has a cart" do
       get 'index'
       assigns(:cart).should_not be_nil
     end

  end
end
