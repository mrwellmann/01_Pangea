class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.string :image_url, :null => false 
      t.decimal :price, :null => false, :precision => 6, :scale => 2
      t.integer :expirience_points, :default =>0

      t.timestamps
    end
    
    add_index :products, :title, :unique => true

    
  end

  def self.down
    drop_table :products
  end
end
