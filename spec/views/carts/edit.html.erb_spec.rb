require 'spec_helper'

describe "carts/edit" do
  before(:each) do
    @cart = assign(:cart, create(:cart))
  end

  it "renders the edit cart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => carts_path(@cart), :method => "post" do
    end
  end
end
