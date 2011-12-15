class AddQuantityToWishItems < ActiveRecord::Migration
    def self.up
        add_column :wish_items, :quantity, :integer, :default => 1
    end
    def self.down
    remove_column :wish_items, :quantity
end
end

