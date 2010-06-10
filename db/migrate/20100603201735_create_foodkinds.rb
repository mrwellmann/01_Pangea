class CreateFoodkinds < ActiveRecord::Migration
  def self.up
    create_table :foodkinds do |t|
      t.string :foodkind_name, :null => false

      t.timestamps
    end
    
    add_index :foodkinds, :foodkind_name, :unique => true
    
    Foodkind.create( :foodkind_name => 'Drinks')
    Foodkind.create( :foodkind_name => 'Breakfests')
    Foodkind.create( :foodkind_name => 'Lunchs')
    Foodkind.create( :foodkind_name => 'Salads')    
    Foodkind.create( :foodkind_name => 'Sides')
    Foodkind.create( :foodkind_name => 'Desserts')


  end

  def self.down
    drop_table :foodkinds
  end
end
