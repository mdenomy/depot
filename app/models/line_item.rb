class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product, :product_id

  belongs_to  :product
  belongs_to  :cart

end
