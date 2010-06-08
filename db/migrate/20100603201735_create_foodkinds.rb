class CreateFoodkinds < ActiveRecord::Migration
  def self.up
    create_table :foodkinds do |t|
      t.string :foodkind_name, :null => false

      t.timestamps
    end
    
    Foodkind.create( :foodkind_name => 'Drink')
    Foodkind.create( :foodkind_name => 'Breakfest')
    Foodkind.create( :foodkind_name => 'Lunch')
    Foodkind.create( :foodkind_name => 'Dessert')
    Foodkind.create( :foodkind_name => 'Aperitif')

  end

  def self.down
    drop_table :foodkinds
  end
end
