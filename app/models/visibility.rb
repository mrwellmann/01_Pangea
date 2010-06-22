class Visibility < ActiveRecord::Base
  has_many :wishlists
  
  validates_presence_of :visibility_kind
 
public  
  def self.getPublic
    return find :first, :conditions => { :visibility_kind => 'Public'}
  end
  
  def self.getPrivate
    return find :first, :conditions => { :visibility_kind => 'Private'}
  end
end
