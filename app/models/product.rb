class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url, :price, :expirience_points
  
  validates_uniqueness_of :title
                                    
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i, 
                                  :message => 'must be a URL for GIF, JPG or PNG image.'
                                  

  validates_numericality_of :price, :greater_than_or_equal_to => 0.01, 
                                    :message => 'has to be a number and at least 0.01 €'
  
  validates_numericality_of :expirience_points, :only_integer => true,
                                                :greater_than_or_equal_to => 0,
                                                :message => 'must be an integer and greater or equal than 0'
  
  attr_accessible :title, :description, :image_url, :price,:expirience_points
  
end
