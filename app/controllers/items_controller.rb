class ItemsController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create, :show, :index, :update, :search, :category]

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
    @item = Item.find(params[:id])
    gon.item_closing_date = @item.closing_date

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
    closing_day = params[:item].delete(:closing_day)
    closing_time = params[:item].delete(:closing_time)
    params[:item][:closing_date] = DateTime.parse(closing_day.to_s + "T" + closing_time.to_s.split(" ")[1,2].join(" "))

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
    closing_day = params.delete(:closing_day)
    closing_time = params.delete(:closing_time)
    passed = true
    begin
      params[:item][:closing_date] = DateTime.parse(closing_day.to_s + "T" + closing_time.to_s.split(" ")[1,2].join(" "))
    rescue Exception => e
      passed = false
    end
    @item = Item.new(params[:item])
    @item.user_id = current_user.id
    respond_to do |format|
      if @item.save and passed
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html {
          flash[:error] = "error in date time format" unless passed
          render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def bid
    if current_user == Item.find(params[:item_id]).user
      flash[:error] = "Can't place bid on your own item."
    elsif Item.find(params[:item_id]).bids.all(:order => "amount DESC").empty?
      if params[:bid_amount].to_f <= Item.find(params[:item_id]).opening_bid
        flash[:error] = "Need to place bid higher than the opening bid"
      else
        Bid.create!(:user_id => current_user.id, :item_id => params[:item_id], :amount => params[:bid_amount])
      end
    elsif Item.find(params[:item_id]).bids.all(:order => "amount DESC").first.amount >= params[:bid_amount].to_f
      flash[:error] = "Your bid needs to be greater than highest bid"
    else
      Bid.create!(:user_id => current_user.id, :item_id => params[:item_id], :amount => params[:bid_amount])
    end
    respond_to do |format|
      format.html {redirect_to Item.find(params[:item_id])}
      format.json {recirect_to Item.find(params[:item_id])}
    end
  end

  def search
    if params[:q].blank?
      render :text => ""
      return
    end
    params[:q].gsub!(/'/,'')
    @search = Redis::Search.complete("Item", params[:q])
    lines = @search.collect do |item|
      puts item
      "#{escape_javascript(item['title'])}#!##{item_path(item['id'])}#!##{item['highest_bid']}#!##{item['closing_date']}#!##{escape_javascript(item['description'])}#!##{item['picture']}"
    end
    render :text => lines.join("\n")
  end

  def category
    if params[:names]
      @items = Item.find_all_by_category(params[:names].split('/'))
    else
      @items = Item.find_all_by_category(params[:name])
    end
    respond_to do |format|
      format.html { render :action => :index }
      format.json { render json: @items }
    end
  end

end
