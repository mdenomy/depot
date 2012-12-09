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
    assert_select 'tr.line_item', 2
  end

  it "shows quantity and title" do
    render :partial => "line_items/line_item",
           :locals => {line_item: @line_item2}
    assert_select 'td', {text:"4&times;"}
    assert_select 'td', {text:"My My"}
  end

  it "has a button to clear the cart" do
    render :partial => "carts/cart",
               :locals => {cart: @cart}
    assert_select "form.button_to" do
    assert_select "input", {value: "Empty cart"}
    end
  end

  it "does not show the cart if it is empty" do
    render :partial => "carts/cart",
                   :locals => {cart: create(:cart)}
    assert_select 'tr.line_item', 0
  end

  it "shows the cart if it has items" do
    render :partial => "carts/cart",
               :locals => {cart: @cart}
    assert_select 'tr.line_item', 2
  end
end
