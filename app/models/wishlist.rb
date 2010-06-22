class Wishlist < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :user
  belongs_to :visibility
  
  validates_presence_of :wishlist_name, :visibility_id , :user_id
  
#  def addProduct(product)
#    products<<product
#  end
#  def findProduct(product)
#    products.exists?(product)
#  end
end
