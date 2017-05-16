FactoryGirl.define do
  factory :auction do
    title {Faker::Book.title}
    details {Faker::Hacker.say_something_smart}
    ends_on {Faker::Date.forward(30)}
    reserve_price {Faker::Number.between(10, 2000)}
    user_id {Faker::Number.between(1, 10)}
    current_bid {1}
  end
end
