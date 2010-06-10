class User < ActiveRecord::Base
  has_many :wish_lists
  
    devise :database_authenticatable, :recoverable, :validatable, :lockable,
         :rememberable, :registerable, :trackable 
    
    validates_uniqueness_of :user_name
  
end
