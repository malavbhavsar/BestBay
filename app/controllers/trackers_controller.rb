class TrackersController < ApplicationController
  before_filter :set_gateway, :only => [:pay_for_all]

  # GET /tracker
  # GET /tracker.json
  def show
    @tracker_won = current_user.bids.find_all_by_tracked(true)
    @tracker_bids = current_user.bids.select("id, item_id, user_id, max(amount) as amount").group("id, item_id")
    @tracker_auctions = Bid.where('item_id in (?)', current_user.xitems).select("id, item_id, user_id, max(amount) as amount").group("id, item_id")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@tracker_won, @tracker_auctions, @tracker_bids] }
    end
  end

  def pay_for_all

    recipients = Array.new

    current_user.bids.find_all_by_tracked(true).each do |bid|
      hash = Hash.new
      hash[:email] =  bid.item.user.email
      hash[:amount] = bid.amount
      hash[:primary] = false
      recipients << hash
    end

    response = $GATEWAY.setup_purchase(
        :return_url => url_for(:controller => 'items', :action => 'index', :only_path => false),
        :cancel_url => url_for(:controller => 'items', :action => 'index', :only_path => false),
        #:ipn_notification_url => url_for(:action => 'notify_action', :only_path => false),
        :receiver_list => recipients
    )

    # For redirecting the customer to the actual paypal site to finish the payment.
    redirect_to ($GATEWAY.redirect_url_for(response["payKey"]))

  end

  def set_gateway
    $GATEWAY ||=  ActiveMerchant::Billing::PaypalAdaptivePayment.new(login: "malav._1351481484_biz_api1.gmail.com",password: "1351481552",signature: "Aj4mir6IgIKZGlDRuN6m0EjAIoBwA.wRjI10neb0SysL4f5Jw-srduc-",appid: "APP-80W284485P519543T")
  end
end