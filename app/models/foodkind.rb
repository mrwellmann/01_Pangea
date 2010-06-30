class Foodkind < ActiveRecord::Base
    has_many :foods, :dependent => :nullify
    
    validates_presence_of :foodkind_name
    validates_uniqueness_of :foodkind_name
    
    attr_accessible :foodkind_name
    
  def self.getAllByName
    find(:all, :order=> :foodkind_name)
  end
end
