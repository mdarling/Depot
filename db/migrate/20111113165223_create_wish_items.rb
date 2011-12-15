class CreateWishItems < ActiveRecord::Migration
  def change
    create_table :wish_items do |t|
      t.integer :product_id
      t.integer :wishlist_id

      t.timestamps
    end
  end
end
