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

  it "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create product" do
    lambda do
      post :create, {:product => valid_attributes}
    end.should change(Product, :count).by(1)
  end

  it "redirects to the created wine" do
    post :create, {:product => valid_attributes}
    response.should redirect_to(Product.last)
  end

  it "should show product" do
    product = Product.create! valid_attributes
    get :show, id: product
    assert_response :success
  end

  it "should get edit" do
    product = Product.create! valid_attributes
    get :edit, id: product
    assert_response :success
  end

  it "updates the product" do
     product = Product.create! valid_attributes
     # Assuming there are no other products in the database, this
     # specifies that the Product created on the previous line
     # receives the :update_attributes message with whatever params are
     # submitted in the request.
     Product.any_instance.should_receive(:update_attributes).with({'these' =>
                                                                 'params'})
     put :update, {:id => product.to_param, :product => {'these' =>
                                                         'params'}}
   end

  it "should destroy product" do
    product = Product.create! valid_attributes
    expect {
      delete :destroy, {:id => product.to_param}
    }.to change(Product, :count).by(-1)
  end
end

