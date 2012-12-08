# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :line_item do
    product
    cart_id 1
    quantity  Random.rand(2..5)
  end
end
