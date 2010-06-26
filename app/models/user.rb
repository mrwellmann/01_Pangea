class User < ActiveRecord::Base
  has_many :wishlists
  has_many :menues
  
    devise :database_authenticatable, :recoverable, :validatable, :lockable,
         :rememberable, :registerable, :trackable 
    
    validates_uniqueness_of :user_name
  
end
