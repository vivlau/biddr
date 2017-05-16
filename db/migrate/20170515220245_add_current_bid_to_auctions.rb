class AddCurrentBidToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :current_bid, :integer
  end
end
