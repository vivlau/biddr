User.create(first_name: "Vivian", last_name: "Lau", email: "vivianwclau@gmail.com", password: "password", password_confirmation: "password")

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password")
end

30.times do
  Auction.create(title: Faker::Book.title, details: Faker::Hacker.say_something_smart, ends_on: Faker::Date.forward(30), reserve_price: Faker::Number.between(10, 2000), user_id: Faker::Number.between(1, 10), current_bid: 1)
end

100.times do
  Bid.create(bid_price: Faker::Number.between(10, 900), user_id: Faker::Number.between(1, 10), auction_id: Faker::Number.between(1, 30))
end
