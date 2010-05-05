class User < ActiveRecord::Base
    devise :database_authenticatable, :recoverable, :validatable, :lockable,
         :rememberable, :registerable, :trackable 


end
