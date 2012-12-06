require 'spec_helper'

describe "carts/show" do
  before(:each) do
    @line_item1 = create(:line_item, product: create(:product,
                                                     title: "Hey Hey"))
    @line_item2 = create(:line_item,
                         product: create(:product, title: "My My"),
                         quantity: 4
                        )
    @cart = create(:cart, line_items: [@line_item1, @line_item2])
  end

  it "shows line items in cart" do
    render
    assert_select 'tr', 2
  end

  it "shows quantity and title" do
    render :partial => "line_items/line_item",
           :locals => {line_item: @line_item2}
    assert_select 'td', {text:"4&times;"}
    assert_select 'td', {text:"My My"}
  end

  it "has a button to clear the cart" do
    render
    assert_select "form.button_to" do
      assert_select "input", {value: "Empty cart"}
    end
  end
end
