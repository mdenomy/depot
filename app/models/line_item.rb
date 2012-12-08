class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product, :product_id, :quantity

  belongs_to  :product
  belongs_to  :cart

  def subtotal
    quantity * product.price
  end

end
