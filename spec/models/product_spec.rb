require "spec_helper"

def new_product(title, description, image_url, price)
  product1 = Product.new(
      title: title,
      description: description,
      image_url: image_url,
      price: price
  )
end

describe "product" do

  it "all attributes must be supplied" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:image_url].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
  end

  it "should require a positive price" do
    product = Product.new(
        title:        "Ruby Adventures",
        description:  "The title says it all",
        image_url:    "RubyAdventures.png"
    )

    [-1, 0.009, 0].each do |price|
      product.price = price
      assert product.invalid?
      assert_equal "must be greater than or equal to 0.01",
                  product.errors[:price].join('; ')
    end
  end

  it "should support valid image formats" do
    product = Product.new(
        title:        "Ruby Adventures",
        description:  "The title says it all",
        price:        1.0
    )

    valid_urls = %w( test.png test.jpg test.gif)
    valid_urls.each do |url|
      product.image_url = url
      assert product.valid?
    end

    product.image_url = "NotAnImage.txt"
    assert  product.invalid?
    assert_equal "must be a URL for a GIF, JPG, or PNG image",
                 product.errors[:image_url].join('; ')
  end

  it "should require that titles are unique" do
    product1 = new_product("Book", "Whatever", "image.png",1.0)
    product1.save

    product2 = new_product("Book", "Whatever", "image.png",1.0)

    assert !product2.save
    assert_equal "has already been taken",
                  product2.errors[:title].join('; ')
  end
end
