require 'spec_helper'

describe "store/index" do

  it "lists all the products" do
    assign(:products, [stub_model(Product), stub_model(Product), stub_model(Product)])
    render
    assert_select "div.entry", 3
  end

  it "listed products have a title, description, image, and price" do
    assign(:products, [stub_model(Product), stub_model(Product)])
    render
    assert_select "div.entry" do
      assert_select "h3"
      assert_select "div.description"
      assert_select "img"
      assert_select "div.price_line span.price"
    end
  end
end
