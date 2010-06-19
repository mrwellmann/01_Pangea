class CreateWishlists < ActiveRecord::Migration
  def self.up
    create_table :wishlists do |t|
      t.string :wishlist_name, :null => false, :default=>"New Wishlist"
      t.integer :user_id, :null => false
      t.string :visibility, :default=>"public", :null=>false


      t.timestamps
    end
    
    create_table :wishlists_products, :id => false do |t|
      t.integer :wishlist_id, :null => false
      t.integer :user_id, :null => false
    end
      
      add_index :wishlists_products, [:user_id, :wishlist_id], :unique => true
      add_index :wishlists_products, :wishlist_id, :unique => false
  end

  def self.down
    drop_table :wishlists
  end
end
