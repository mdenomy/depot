require 'spec_helper'

describe Cart do
  describe "line item association" do

    before(:each) do
      @cart = create(:cart)
      @line_items = @cart.line_items.create()
    end

    it "should respond to line item" do
      @cart.should respond_to(:line_items)
    end

    it "should have the right line items" do
      @cart.line_items.should == [@line_items]
    end
  end
end
