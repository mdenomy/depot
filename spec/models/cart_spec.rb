require 'spec_helper'


describe Cart do
  describe "line item association" do

    before(:each) do
      @cart = Cart.create
    end

    def add_to_cart(line_item)
      @cart.add_product(line_item.product_id)
      @cart.save
    end

    it "should respond to line item" do
      @cart.should respond_to(:line_items)
    end

    it "should increment the quantity when you add the same product" do
      line_item = create(:line_item)
      add_to_cart(line_item)
      added_item = @cart.add_product(line_item.product_id)
      added_item.quantity.should == 2
    end

    it "should calculate the total" do
      line_item1 = create(:line_item, product: create(:product, price: 33.33), quantity: 1)
      line_item2 = create(:line_item, product: create(:product, price: 50.00), quantity: 2)
      @cart = create(:cart, line_items: [line_item1, line_item2])
      @cart.total.should eq 133.33
    end

    it "should be empty when there are no items in it" do
      @cart.empty?.should be_true
     end

    it "should not be empty if there are items in it" do
      line_item = create(:line_item)
       add_to_cart line_item
       @cart.empty?.should be_false
    end
  end
end
