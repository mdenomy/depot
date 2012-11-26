require 'spec_helper'

describe LineItem do

  describe "cart associations" do

    before(:each) do
      @cart = create(:cart)
      @attr = {}
      @line_item = @cart.line_items.create()
    end
    it "should have a cart attribute" do
      @line_item.should respond_to(:cart)
    end

    it "should have the correct cart" do
      @line_item.cart.should == @cart
    end

    it "should have a product attribute" do
      @line_item.should respond_to(:product)
    end

    it "should have the correct product" do
      @line_item.product.should == @product
    end
  end
end
