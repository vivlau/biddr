class BidsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @auctions = @user.bids
  end

  def create
    @auction = Auction.find params[:auction_id]
    @bid = Bid.new bid_params
    @bid.auction = @auction
    @bid.user = current_user

    if @bid.save
      redirect_to auction_path(params[:auction_id])
    else
      render 'auctions/show'
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:bid_price, :created_at, :auction_id, :user_id)
  end

end
