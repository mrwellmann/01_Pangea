class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :name,                        :null => false
      t.database_authenticatable :encryptor => :sha1, :null => false
      t.recoverable
      t.trackable
      t.lockable
      t.timeoutable
      
      t.timestamps
    end
    
    add_index :admins, :name,                 :unique => true
    add_index :admins, :email,                :unique => true
    add_index :admins, :reset_password_token, :unique => true
    
  end

  def self.down
    drop_table :admins
  end
end
