class Foodkind < ActiveRecord::Base
    has_many :foods, :dependent => :nullify
    
    validates_presence_of :foodkind_name
end
