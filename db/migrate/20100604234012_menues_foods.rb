class MenuesFoods < ActiveRecord::Migration
  def self.up
    create_table :menues_foods, :id => false do |t|
    t.integer :menue_id, :null => false
    t.integer :food_id, :null => false
  end
  
  add_index :menues_foods, [:menue_id, :food_id], :unique => true
  add_index :menues_foods, :food_id, :unique => false

  end

  def self.down
  end
end
