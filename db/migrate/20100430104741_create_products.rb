class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :product_name, :null => false
      t.text :description
      t.string :image_url
      t.decimal :price,       :precision => 6, :scale => 2, :null => false
      t.integer :expirience_points, :null => false
      t.integer :continent_id
      
      t.timestamps
    end
    
    add_index :products, :product_name, :unique => true

    
  end

  def self.down
    drop_table :products
  end
end
