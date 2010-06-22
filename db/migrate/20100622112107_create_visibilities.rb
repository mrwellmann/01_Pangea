class CreateVisibilities < ActiveRecord::Migration
  def self.up
    create_table :visibilities do |t|
      t.string :visibility_kind, :null => false, :unique => true
      
      t.timestamps
    end
    
    add_index :visibilities, :visibility_kind, :unique => true
    
    Visibility.create( :visibility_kind => 'Public')
    Visibility.create( :visibility_kind => 'Private')
    
  end

  def self.down
    drop_table :visibilities
  end
end
