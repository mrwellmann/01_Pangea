class Admin < ActiveRecord::Base
   devise :database_authenticatable, :registerable, :timeoutable, :validatable,
   :lockable
   validates_uniqueness_of :user_name
end
