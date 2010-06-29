class CreateMenues < ActiveRecord::Migration
  def self.up
    create_table :menues do |t|
      t.string :menue_name, :null => false
      t.text :description
      t.decimal :price, :precision => 6, :scale => 2, :null => false
      t.integer :user_id
      t.integer :visibility_id
      t.integer :expirience_points, :null => false

      t.timestamps
    end
    
    add_index :menues, :menue_name, :unique => false
    
  end

  def self.down
    drop_table :menues
  end
end
