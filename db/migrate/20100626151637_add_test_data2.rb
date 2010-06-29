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
                 
#Wishlists
    #public            
    Wishlist.create(:wishlist_name => 'Public Wishlist 1 User 1',
                  :product_ids => [1,3],
                  :user_id => 1,
                  :visibility_id => 1)
                  
    Wishlist.create(:wishlist_name => 'Public Wishlist 2  User 1',
                  :product_ids => [1,2,3,4,5],
                  :user_id => 1,
                  :visibility_id => 1)

    Wishlist.create(:wishlist_name => 'Public Wishlist 3  User 1',
                  
                  :user_id => 1,
                  :visibility_id => 1)
                  
    Wishlist.create(:wishlist_name => 'Public Wishlist 1  User 2',
                  :product_ids => [5,3,1],
                  :user_id => 2,
                  :visibility_id => 1)

    Wishlist.create(:wishlist_name => 'Public Wishlist 2  User 2',
                  
                  :user_id => 2,
                  :visibility_id => 1)
    #private             
    Wishlist.create(:wishlist_name => 'Private Wishlist 1 User 1',
                  :product_ids => [2,3,1],
                  :user_id => 1,
                  :visibility_id => 2)
 
    Wishlist.create(:wishlist_name => 'Private Wishlist 2 User 1',
                  
                  :user_id => 1,
                  :visibility_id => 2) 
  
    Wishlist.create(:wishlist_name => 'Private Wishlist 1 User 2',
                  :product_ids => [1,2,3,4],
                  :user_id => 1,
                  :visibility_id => 2)
 
    Wishlist.create(:wishlist_name => 'Private Wishlist 2 User 2',
                  
                  :user_id => 2,
                  :visibility_id => 2)   
 
#Menues
    #Main Menues               
    Menue.create(:menue_name => 'Last meal',
                  :food_ids => [1,5],
                  :description => 'Last meal bevore you are gone',
                  :expirience_points => 30,
                  :price => 2.99)

    Menue.create(:menue_name => '4 Continents',
                  :food_ids => [12,10,2,7],
                  :description => 'Someting from South Amerika, Nort Amerika, Europe, Asia',
                  :expirience_points => 70,
                  :price => 9.99)
    #public Menues              
    Menue.create(:menue_name => 'Public Meal 1 User 1',
                  :food_ids => [3,4,9],
                  :user_id => 1,
                  :visibility_id =>1,
                  :description => 'Alcoholic',
                  :expirience_points => 50,
                  :price => 9.93)
                  
    Menue.create(:menue_name => 'Public Meal 2 User 1',
                  
                  :user_id => 1,
                  :visibility_id =>1,
                  :description => 'Empty Meal',
                  :expirience_points => 0,
                  :price => 0)
                  
    Menue.create(:menue_name => 'Public Meal 1 User 2',
                  :food_ids => [1,7,12],
                  :user_id => 2,
                  :visibility_id =>1,
                  :description => 'Healthy Mix',
                  :expirience_points => 35,
                  :price => 8.17)
                  
    #private Menues              
    Menue.create(:menue_name => 'Private Meal 1 User 1',
                  :food_ids => [1,2,3,4],
                  :user_id => 1,
                  :visibility_id =>2,
                  :description => 'Thirsty?',
                  :expirience_points => 65,
                  :price => 11.96)
                  
    Menue.create(:menue_name => 'Private Meal 2 User 1',
                  :food_ids => [1,2,3,4,5,6,7,8,9,10,11,12],
                  :user_id => 1,
                  :visibility_id =>2,
                  :description => 'Everything',
                  :expirience_points => 175,
                  :price => 29.6)
                  
    Menue.create(:menue_name => 'Private Meal 1 User 2',
                  :food_ids => [2,11,8,9],
                  :user_id => 2,
                  :visibility_id =>2,
                  :description => 'Unhealthy Mix',
                  :expirience_points => 55,
                  :price => 7.12)
  
  end
  
  def self.down
    Wishlist.delete_all
    Menue.delete_all
    User.delete_all
    Admin.delete_all
  end
end
