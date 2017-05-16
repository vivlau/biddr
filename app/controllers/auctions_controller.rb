class AuctionsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @auctions = Auction.order(created_at: :desc)
  end

  def show
    which_auction = params[:id]
    @auction = Auction.find(which_auction)
    @bid = Bid.new
    @bids = Bid.where(auction_id: @auction).order(created_at: :desc)
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :details, :ends_on, :reserve_price)
  end
end
