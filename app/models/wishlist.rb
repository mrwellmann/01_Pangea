class Wishlist < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :user
  belongs_to :visibility
  
  validates_presence_of :wishlist_name, :visibility_id , :user_id
 
  attr_accessible :wishlist_name, :visibility_id, :user_id, :product_ids
 
  def self.findAllOwedByUser(user_id)
    find(:all, {:conditions => {:user_id => user_id}})
  end
  
#  def addProduct(product)
#    products<<product
#  end
#  def findProduct(product)
#    products.exists?(product)
#  end
end
