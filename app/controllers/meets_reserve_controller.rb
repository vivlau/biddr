class MeetsReserveController < ApplicationController
  before_action :authenticate_user!

  def create
    auction = Auction.find params[:auction_id]
    if auction.meet_reserve!
      redirect_to auction, notice: 'Auction has met reserve!'
    end
  end
end
