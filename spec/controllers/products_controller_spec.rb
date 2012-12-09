require 'spec_helper'

describe ProductsController do

  def valid_attributes
    {
        title:        "Zen Ruby",
        description:  "All work and no play make Matz a dull boy",
        image_url:    "zr.png",
        price:        12.34
    }
  end

  before(:each) do
  end

  it "should create product" do
    lambda do
      post :create, {:product => valid_attributes}
    end.should change(Product, :count).by(1)
  end

  it "should destroy product" do
    product = Product.create! valid_attributes
    expect {
      delete :destroy, {:id => product.to_param}
    }.to change(Product, :count).by(-1)
  end
end

