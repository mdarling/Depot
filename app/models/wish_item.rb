class WishItem < ActiveRecord::Base
    belongs_to :product
    belongs_to :wishlist
    
    def total_price
        product.price * quantity
    end
end
