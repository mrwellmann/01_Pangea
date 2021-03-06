class CreateFoods < ActiveRecord::Migration
  def self.up
    create_table :foods do |t|
      t.string :food_name,          :null => false
      t.text :description
      t.string :image_url         
      t.decimal :price,             :precision => 6, :scale => 2, :null => false 
      t.integer :expirience_points,  :null => false
      t.integer :continent_id
      t.integer :foodkind_id,       :null => false

      t.timestamps
    end
    
    add_index :foods, :food_name, :unique => true
    
  end

  def self.down
    drop_table :foods
  end
end
