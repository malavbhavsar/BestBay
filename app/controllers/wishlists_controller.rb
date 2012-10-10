class WishlistsController < ApplicationController
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
    @wishlist = Wishlist.new(params[:wishlist])

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully created.' }
        format.json { render json: @wishlist, status: :created, location: @wishlist }
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
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
