class AddTestData2 < ActiveRecord::Migration
  def self.up
    Wishlist.delete_all
    Menue.delete_all
    User.delete_all
    Admin.delete_all
    
    Admin.create(:user_name =>'admin',
                 :email => 'admin@admin.de',
                 :password => '1234567',
                 :password_confirmation => '1234567')
    
    Admin.create(:user_name =>'admin2',
                 :email => 'admin2@admin.de',
                 :password => '7654321',
                 :password_confirmation => '7654321')
                 
    User.create(:user_name =>'user',
                 :email => 'user@user.de',
                 :password => '1234567',
                 :password_confirmation => '1234567')
                 
    User.create(:user_name =>'user2',
                 :email => 'user2@user.de',
                 :password => '7654321',
                 :password_confirmation => '7654321')
                 
                 
    Menue.create(:meune_name => 'Mittag 1',
                  :description => 'Mittags Menue Nummer 1',
                  :expirience_points => 50,
                  :price => 5.49)
                  
    Wishlist.create(:wishlist_name => 'W1',
                  #:product_ids => [[1],[3]],
                  :user_id => 1,
                  :visibility_id => 1)
  end
  
  def self.down
    Wishlist.delete_all
    Menue.delete_all
    User.delete_all
    Admin.delete_all
  end
end
