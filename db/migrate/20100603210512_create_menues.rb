class CreateMenues < ActiveRecord::Migration
  def self.up
    create_table :menues do |t|
      t.string :menue_name, :null => false
      t.string :image_url
      t.text :description
      t.decimal :price, :precision => 6, :scale => 2
      t.integer :expirience_points, :default =>0

      t.timestamps
    end
    
    add_index :menues, :menue_name, :unique => true
    
  end

  def self.down
    drop_table :menues
  end
end
