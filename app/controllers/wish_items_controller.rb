class WishItemsController < ApplicationController
  # GET /wish_items
  # GET /wish_items.json
  def index
    @wish_items = WishItem.all
    @cart = current_cart
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wish_items }
    end
  end

  # GET /wish_items/1
  # GET /wish_items/1.json
  def show
    @wish_item = WishItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wish_item }
    end
  end

  # GET /wish_items/new
  # GET /wish_items/new.json
  def new
    @wish_item = WishItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wish_item }
    end
  end

  # GET /wish_items/1/edit
  def edit
    @wish_item = WishItem.find(params[:id])
  end

  # POST /wish_items
  # POST /wish_items.json
  def create
    @wishlist = current_wishlist
    product = Product.find(params[:product_id])
    @wish_item = @wishlist.add_product(product.id)
    
    respond_to do |format|
      if @wish_item.save
          format.html { redirect_to(@wish_item.wishlist, :notice => 'Line item was successfully created.') }
        format.json { render json: @wish_item, status: :created, location: @wish_item }
      else
        format.html { render action: "new" }
        format.json { render json: @wish_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wish_items/1
  # PUT /wish_items/1.json
  def update
    @wish_item = WishItem.find(params[:id])

    respond_to do |format|
      if @wish_item.update_attributes(params[:wish_item])
        format.html { redirect_to @wish_item, notice: 'Wish item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @wish_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wish_items/1
  # DELETE /wish_items/1.json
  def destroy
    @wish_item = WishItem.find(params[:id])
    @wish_item.destroy

    respond_to do |format|
      format.html { redirect_to wish_items_url }
      format.json { head :ok }
    end
  end
end
