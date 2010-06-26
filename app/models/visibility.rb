class Visibility < ActiveRecord::Base
  has_many :wishlists
  has_many :menues
  
  validates_presence_of :visibility_kind
  validates_uniqueness_of :visibility_kind
  
  attr_accessible :visibility_kind
 
public  
  def self.getPublic
    return find :first, :conditions => { :visibility_kind => 'Public'}
  end
  
  def self.getPrivate
    return find :first, :conditions => { :visibility_kind => 'Private'}
  end
end
