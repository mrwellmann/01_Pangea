class WishlistsController < InheritedResources::Base
  before_filter :check_somebody_logged_in , :except => [:show, :index]
  
  respond_to :html, :xml
  
  
  private

  
end
