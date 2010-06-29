class User < ActiveRecord::Base
  has_many :wishlists, :dependent => :nullify
  has_many :menues, :dependent => :nullify
  
    devise :database_authenticatable, :recoverable, :validatable, :lockable,
         :rememberable, :registerable, :trackable 
    
    validates_uniqueness_of :user_name
    validates_presence_of :user_name
  
end
