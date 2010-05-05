class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :name,                        :null => false
      t.database_authenticatable :encryptor => :sha1, :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.lockable

      t.timestamps
    end
    
    add_index :users, :name,                 :unique => true
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    
  end

  def self.down
    drop_table :users
  end
end
