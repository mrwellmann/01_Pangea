class Menue < ActiveRecord::Base
  has_and_belongs_to_many :foods
  belongs_to :user
  has_many :visibilitys
  
  validates_presence_of :menue_name, :expirience_points, :price
                                  
  validates_numericality_of :price, :greater_than_or_equal_to => 0.01, 
                                    :message => 'has to be a number and at least 0.01 €'
   
   attr_accessible :menue_name, :description, :price, :expirience_points,:visibility_id, :image_url, :user_id, :food_ids
   
  
end
