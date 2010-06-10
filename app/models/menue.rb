class Menue < ActiveRecord::Base
  has_and_belongs_to_many :foods
  
  validates_presence_of :menue_name, :image_url, :expirience_points, :price
  
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i, 
                                  :message => 'must be a URL for GIF, JPG or PNG image.'
                                  
  validates_numericality_of :price, :greater_than_or_equal_to => 0.01, 
                                    :message => 'has to be a number and at least 0.01 €'
   
   attr_accessible :menue_name, :description, :image_url, :price, :expirience_points 
   

  def add_food(food)
    foods << food
  end
 
  def add_foo()
   # foods << food
  end
  
end
