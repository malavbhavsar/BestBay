class WishlistsController < ApplicationController
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
        format.html { render action: "new", error: @wishlist.errors }
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
        format.html { render action: "edit", error: @wishlist.errors }
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
end
