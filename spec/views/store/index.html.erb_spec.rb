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

  it "each product has a button to add products to cart" do
    assign(:products, [stub_model(Product), stub_model(Product)])
    render
    assert_select "div.entry form.button_to", 2 do
      assert_select "input", {value: "Add to cart"}
    end
  end

  it "shows the number of times that the store index has been accessed" do
    assign(:products, [stub_model(Product), stub_model(Product)])
    render
    assert_select "div.store_counter", 1
    assert_select "div.store_counter",
                  {text: "The catalog has been accessed 0 times"}
  end
end
