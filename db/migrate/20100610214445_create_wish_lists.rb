class CreateWishLists < ActiveRecord::Migration
  def self.up
    create_table :wish_lists do |t|
      t.string :wish_list_name
      t.integer :user_id

      t.timestamps
    end
    
    create_table :wish_lists_products, :id => false do |t|
      t.integer :wish_list_id, :null => false
      t.integer :product_id, :null => false
    end
    
      add_index :wish_lists_products, [:wish_list_id, :product_id], :unique => true
      add_index :wish_lists_products, :product_id, :unique => false
  end

  def self.down
    drop_tabel :wish_lists_products
    drop_table :wish_lists
  end
end
