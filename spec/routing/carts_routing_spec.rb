require "spec_helper"

describe CartsController do
  describe "routing" do

    it "routes to #destroy" do
      delete("/carts/1").should route_to("carts#destroy", :id => "1")
    end

  end
end
