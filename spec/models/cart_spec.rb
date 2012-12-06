require 'spec_helper'

describe Cart do
  describe "line item association" do

    before(:each) do
      @cart = Cart.create
      @line_items = @cart.line_items.create()
    end

    it "should respond to line item" do
      @cart.should respond_to(:line_items)
    end

    it "should have the right line items" do
      @cart.line_items.should == [@line_items]
    end

    it "should increment the quantity when you add the same product" do
      line_item = LineItem.create
      @cart.add_product(line_item.product_id)
      added_item = @cart.add_product(line_item.product_id)
      added_item.quantity.should == 2
    end
  end
end
