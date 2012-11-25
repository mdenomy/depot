FactoryGirl.define do
  factory :product do
    title       Faker::Lorem.sentence(4)
    description Faker::Lorem.sentence(20)
    image_url   "test.png"
    price       Random.rand(10...75)
  end
end