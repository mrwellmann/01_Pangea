class CreateMenues < ActiveRecord::Migration
  def self.up
    create_table :menues do |t|
      t.string :menue_name
      t.text :description
      t.integer :expirience_points
      t.decimal :price
      t.integer :food_id

      t.timestamps
    end
  end

  def self.down
    drop_table :menues
  end
end
