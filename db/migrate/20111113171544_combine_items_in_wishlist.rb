class CombineItemsInWishlist < ActiveRecord::Migration
    def self.up
    #replace multiple items for a single product in a cart with a single item
    Wishlist.all do |wishlist|
    #count the number of each product in the cart
    sums = wishlist.wish_items.group(:product_id).sum(:quantity)
    
    sums.each do |product_id, quantity|
    if quantity > 1
    # remove individual items
    wishlist.wish_items.create(:product_id=>product_id).delete_all
    
    # replace with single item
    wishlist.wish_items.create(:product_id=>product_id, :quantity=>quantity)
end
end
end
end

def self.down
#split items with quantity>1 into multiple items
WineItem.where("quantity>1").each do |wish_item|
    #add individual items
    wish_item.quantity.times do
        WishItem.create :wishlist_id=>wish_item.wishlist_id,
        :product_id=>wish_item.product_id, :quantity=>1
    end
    #remove original item
    wish_item.destroy
end
end
end