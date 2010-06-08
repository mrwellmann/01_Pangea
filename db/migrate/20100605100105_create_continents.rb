class CreateContinents < ActiveRecord::Migration
  def self.up
    create_table :continents do |t|
      t.string :continent_name, :null => false

      t.timestamps
    end
        
    Continent.create( :continent_name => 'Amerika')
    Continent.create( :continent_name => 'North America')
    Continent.create( :continent_name => 'South Amerika')
    Continent.create( :continent_name => 'Afrika')
    Continent.create( :continent_name => 'Asia')
    Continent.create( :continent_name => 'Europe')
    Continent.create( :continent_name => 'Australia')
    
    
  end

  def self.down
    drop_table :continents
  end
end
