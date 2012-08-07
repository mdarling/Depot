class WishlistsController < ApplicationController
  # GET /wishlists
  # GET /wishlists.json
  def index
    @wishlists = Wishlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wishlists }
    end
  end

  # GET /wishlists/1
  # GET /wishlists/1.json
  def show
      begin
          @cart = current_cart
          @wishlist = Wishlist.find(params[:id])
      rescue ActiveRecord::RecordNotFound
          logger.error "Attempt to access invalid Wishlist #{params[:id]}"
          redirect_to store_url, :notice => 'Invalid wishlist'
    else
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wishlist }
    end
  end
end

  # GET /wishlists/new
  # GET /wishlists/new.json
  def new
    @wishlist = Wishlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wishlist }
    end
  end

  # GET /wishlists/1/edit
  def edit
    @wishlist = Wishlist.find(params[:id])
  end

  # POST /wishlists
  # POST /wishlists.json
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

  # PUT /wishlists/1
  # PUT /wishlists/1.json
  def update
    @wishlist = Wishlist.find(params[:id])

    respond_to do |format|
      if @wishlist.update_attributes(params[:wishlist])
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1
  # DELETE /wishlists/1.json
  def destroy
    @wishlist = current_wishlist
    @wishlist.destroy

      # session[:wishlist_id] = nil 
      #Wishlist.count -= 1
      
    respond_to do |format|
        format.html { redirect_to(store_url, :notice => 'Your wishlist is currently empty') }     
        format.json { head :ok }
    end
  end
end
