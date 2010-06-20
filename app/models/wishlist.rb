class Wishlist < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :user
  
#  def addProduct(product)
#    products<<product
#  end
#  def findProduct(product)
#    products.exists?(product)
#  end
end
