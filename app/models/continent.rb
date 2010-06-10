class Continent < ActiveRecord::Base
  has_many :foods, :dependent => :nullify
  has_many :products, :dependent => :nullify
  
   validates_presence_of :continent_name
   
   attr_accessible :continent_name
end
