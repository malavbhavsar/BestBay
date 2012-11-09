class WishlistsController < ApplicationController
before_filter :set_gateway, :only => [:pay_for_all]
  def index
    @wishlist = Wishlist.new
    @wishlists = current_user.wishlists
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wishlists }
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @wishlist = Wishlist.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wishlist }
    end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @wishlist = Wishlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wishlist }
    end
  end

  # POST /carts
  # POST /carts.json
  def create
    @wishlist = current_user.wishlists.build(params[:wishlist])

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to wishlists_url, notice: 'Wishlist was successfully created.' }
        format.json { redirect_to wishlists_url }
      else
        format.html { render action: "new" }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @wishlist = Wishlist.find(params[:id])

    respond_to do |format|
      if @wishlist.update_attributes(params[:wishlist])
        format.html { redirect_to wishlists_url, notice: 'Wishlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def empty_wishlist
    @wishlist = Wishlist.find(params[:id])
    @wishlist.line_items.each {|li| li.destroy}

    respond_to do |format|
      format.html {redirect_to wishlists_url}
      format.json {redirect_to wishlists_url}
    end

  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy

    respond_to do |format|
      format.html { redirect_to wishlists_url }
      format.json { head :no_content }
    end
  end

  def edit
    @wishlist = Wishlist.find(params[:id])
  end

  def pay_for_all
    wishlist = Wishlist.find(params[:wishlist_id])

    recipients = Array.new

    wishlist.line_items.each do |line|
      hash = Hash.new
      hash[:email] =  line.item.user.email
      hash[:amount] = line.item.bids.order("amount DESC").first.amount
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
