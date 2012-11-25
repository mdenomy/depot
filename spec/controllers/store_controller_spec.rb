require 'spec_helper'

describe StoreController do

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
  end

end
