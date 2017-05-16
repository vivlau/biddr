class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :user

  validate :bid_is_higher_than_current_highest

  def bid_is_higher_than_current_highest
    if auction.current_bid.present? && (self.bid_price <= auction.current_bid)
      errors.add(:bid_price, "Bid price must be higher than current listed price!")
    end
  end

  validate :user_cant_bid_on_their_own_auction

  def user_cant_bid_on_their_own_auction
    if auction.user_id == self.user_id
      errors.add(:bid_price, "You cannot bid on your own auction!")
    end
  end

  after_commit do
    auction.update_attribute(:current_bid, self.bid_price)
  end

end
