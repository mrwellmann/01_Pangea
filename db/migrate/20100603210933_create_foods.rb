class CreateFoods < ActiveRecord::Migration
  def self.up
    create_table :foods do |t|
      t.string :food_name, :null => false
      t.text :description, :null => false
      t.string :image_url, :null => false 
      t.integer :price, :null => false, :precision => 6, :scale => 2
      t.integer :expirience_points,:null => false, :default =>0
      t.integer :continent_id
      t.integer :foodkind_id
      t.integer :menue_id

      t.timestamps
    end
  end

  def self.down
    drop_table :foods
  end
end
