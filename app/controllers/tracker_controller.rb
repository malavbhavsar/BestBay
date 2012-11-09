class TrackerController < ApplicationController
  # GET /carts/1
  # GET /carts/1.json
  def show
    debugger
    @tracker_bids = current_user.bids.select("id, item_id, user_id, max(amount) as amount").group("item_id")
    @tracker_auctions = Bid.where('item_id in (?)', current_user.items).select("id, item_id, user_id, max(amount) as amount").group("item_id")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@tracker_auctions, @tracker_bids] }
    end
  end
end