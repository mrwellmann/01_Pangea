class Menue < ActiveRecord::Base
  has_and_belongs_to_many :foods
  belongs_to :user
  belongs_to :visibility
  
  validates_presence_of :menue_name, :expirience_points, :price
                                  
  validates_numericality_of :price,:expirience_points
  
  validates_numericality_of :price, :greater_than_or_equal_to => 0,
                                    :message => 'must be greater or equal than 0'  
  
  validates_numericality_of :expirience_points, :only_integer => true,
                                                :greater_than_or_equal_to => 0,
                                                :message => 'must be an integer and greater or equal than 0'
   
  attr_accessible :menue_name, :description, :price, :expirience_points,:visibility_id, :image_url, :user_id, :food_ids
   
end
