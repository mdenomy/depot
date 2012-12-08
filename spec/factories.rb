FactoryGirl.define do
  factory :product do
    sequence(:title) {|n| "Book#{n}" }
    description Faker::Lorem.sentence(20)
    image_url   "test.png"
    price       Random.rand(10...75)
  end
end