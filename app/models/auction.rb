class Auction < ApplicationRecord
  has_many :bids, dependent: :destroy
  has_many :watches, dependent: :destroy
  belongs_to :user

  has_many :watchers, through: :watches, source: :user

  before_create do
    self.current_bid = 1
  end

  include AASM

  aasm whiny_transitions: false do

    state :draft, initial: true
    state :published
    state :reserve_met
    state :won
    state :canceled
    state :reserve_not_met

    event :publish do
      transitions from: :draft, to: :published
    end

    event :meet_reserve do
      transitions from: :published, to: :reserve_met
    end

    event :win do
      transitions from: :reserve_met, to: :won
    end

    event :cancel do
      transitions from: [:published, :reserve_met], to: :cancelled
    end

    event :dont_meet_reserve do
      transitions from: :published, to: :reserve_not_met
    end

  end

  def watched_by?(user)
    watches.exists?(user: user)
  end

  def watch_for(user)
    watches.find_by(user: user)
  end

end
