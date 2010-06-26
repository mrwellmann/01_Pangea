class CreateWishlists < ActiveRecord::Migration
  def self.up
    create_table :wishlists do |t|
      t.string :wishlist_name, :null => false, :default=>"New Wishlist"
      t.integer :user_id, :null => false
      t.integer :visibility_id, :null=>false


      t.timestamps
    end
    
    add_index :wishlists, :wishlist_name, :unique => false        
    
    create_table :products_wishlists, :id => false do |t|
      t.integer :wishlist_id, :null => false
      t.integer :product_id, :null => false
    end
      
     add_index :products_wishlists, [:product_id, :wishlist_id], :unique => true
     add_index :products_wishlists, :wishlist_id, :unique => false
  end

  def self.down
    drop_table :wishlists
  end
end
