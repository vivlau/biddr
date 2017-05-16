FactoryGirl.define do
  factory :bid do
    bid_price {Faker::Number.between(10, 900)}
    user_id {Faker::Number.between(1, 10)}
    auction_id {Faker::Number.between(1, 30)}
  end
end
