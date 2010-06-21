class WishlistsController < InheritedResources::Base
  before_filter :authenticate_user! , :except => [:show, :index]
  
  respond_to :html, :xml
  
  def index
    @wishlists = Wishlist.find :all, :conditions => { :user_id => current_user.id}
  end
  
  

  def show
    @wishlist = Wishlist.find(params[:id])
  end  
  
  def create
    @wishlist = Wishlist.new(params[:wishlist])
    @wishlist.user_id = current_user.id
    create!
  end
  
  def remove_product
    @wishlist = Wishlist.find(params[:id])
    @product = @wishlist.products.find(params[:product_id])
    @wishlist.products.delete(@product)
    
    #TODO render instead of redirect but need to fix root first
    #render :action => "show"
    redirect_to(@wishlist)
  end
  
  
end
