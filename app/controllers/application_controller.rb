class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    
    def current_cart
        Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
    
    def current_wishlist
        Wishlist.find(session[:wishlist_id])
        rescue ActiveRecord::RecordNotFound
        wishlist = Wishlist.create
        session[:wishlist_id] = wishlist.id
        wishlist
    end


end
