class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :user_name,                        :null => false
      t.database_authenticatable :encryptor => :sha1, :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.lockable
      
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :place
      t.string :zip_code
      t.string :country
      t.integer :expirience_points, :default =>0

      t.timestamps
    end
    
    add_index :users, :user_name,            :unique => true
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    
  end

  def self.down
    drop_table :users
  end
end
