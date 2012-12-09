require 'spec_helper'

describe "carts/new" do
  before(:each) do
    assign(:cart, create(:cart))
  end

  it "renders new cart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => carts_path, :method => "post" do
    end
  end
end
