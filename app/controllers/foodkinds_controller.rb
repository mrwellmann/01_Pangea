class FoodkindsController < InheritedResources::Base
  before_filter :authenticate_admin!
  
  respond_to :html, :xml
end
