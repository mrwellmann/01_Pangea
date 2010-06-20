class Product < ActiveRecord::Base
  belongs_to :continent
  has_and_belongs_to_many :wishlists
   
  
  validates_presence_of :product_name, :image_url, :price, :expirience_points
  
  validates_uniqueness_of :product_name
                                    
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i, 
                                  :message => 'must be a URL for GIF, JPG or PNG image.'
                                  

  validates_numericality_of :price, :greater_than_or_equal_to => 0.01, 
                                    :message => 'has to be a number and at least 0.01 €'
  
  validates_numericality_of :expirience_points, :only_integer => true,
                                                :greater_than_or_equal_to => 0,
                                                :message => 'must be an integer and greater or equal than 0'
  
  attr_accessible :product_name, :description, :image_url, :price,:expirience_points,:continent_id,:wishlist_ids
  

end
