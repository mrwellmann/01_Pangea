class FoodsMenues < ActiveRecord::Migration
  def self.up
    create_table :foods_menues, :id => false do |t|
    t.integer :menue_id, :null => false
    t.integer :food_id, :null => false
  end
  
  add_index :foods_menues, [:menue_id, :food_id], :unique => true
  add_index :foods_menues, :food_id, :unique => false

  end

  def self.down
  end
end
