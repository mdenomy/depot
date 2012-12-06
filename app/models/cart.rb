class Cart < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many  :line_items, dependent: :destroy

  def add_product(product_id)
    line_item = line_items.find_by_product_id(product_id)
    if line_item
      line_item.quantity += 1
    else
      line_item = line_items.build(product_id: product_id)
    end
    line_item
  end
end
