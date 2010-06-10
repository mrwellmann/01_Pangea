class CreateMenues < ActiveRecord::Migration
  def self.up
    create_table :menues do |t|
      t.string :menue_name, :null => false 
      t.text :description
      t.string :image_url, :null => false 
      t.decimal :price, :null => false, :precision => 6, :scale => 2
      t.integer :expirience_points, :null => false, :default =>0

      t.timestamps
    end
    
    add_index :menues, :menue_name, :unique => true
    
  end

  def self.down
    drop_table :menues
  end
end
