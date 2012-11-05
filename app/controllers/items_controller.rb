class ItemsController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create, :show, :index, :update]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @current_time = Time.now
    @item = Item.find(params[:id])
    @check_time = (Time.parse(@item.closing_date.to_s)-Time.parse(DateTime.now.to_s))/3600

    @highest_bid = @item.highest_bid

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    @item.user_id = current_user.id
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def bid
    if current_user == Item.find(params[:item_id]).user
      flash[:error] = "Can't place bid on your own item."
    elsif Item.find(params[:item_id]).bids.all(:order => "amount DESC").first.amount >= params[:bid_amount].to_f
      flash[:error] = "Your bid needs to be greater than highest bid"
    else
      Bid.create!(:user_id => current_user.id, :item_id => params[:item_id], :amount => params[:bid_amount])
    end
    respond_to do |format|
      format.html {redirect_to Item.find(params[:item_id])}
      format.json {recirect_to Item.fina(params[:item_id])}
    end
  end
end
