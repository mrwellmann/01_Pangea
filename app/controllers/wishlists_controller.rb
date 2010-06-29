class WishlistsController < InheritedResources::Base
  before_filter :authenticate_user!
  
  respond_to :html, :xml
  
  def index
    @wishlists = Wishlist.find :all, :conditions => { :user_id => current_user.id}
    index!
  end
  
  def show
    @wishlist = Wishlist.find(params[:id])
    if @wishlist.user_id == current_user.id
      show!
      return
    elsif @wishlist.visibility == Visibility.getPublic
      showPublicWishlist
      return
    elsif @wishlist.visibility == Visibility.getPrivate
      acsessValidation
      return
    end
  end  
  
  def new
    @wishlist = Wishlist.new
    generate_visibility_list
    new!
  end
  
  def edit
    @wishlist = Wishlist.find(params[:id])
    if @wishlist.user_id == current_user.id
      generate_visibility_list
      edit!
    else
      acsessValidation
    end
    
  end
  
  def create
    generate_visibility_list
    @wishlist = Wishlist.new(params[:wishlist])
    @wishlist.user_id = current_user.id
    create!{wishlists_path}
  end
  
  def update
    generate_visibility_list
    update!
  end
  
  def remove_product
    @wishlist = Wishlist.find(params[:id])
    if @wishlist.user_id == current_user.id
      @product = @wishlist.products.find(params[:product_id])
      @wishlist.products.delete(@product)
      #TODO render instead of redirect but need to fix root first
      #render :action => "show"
      redirect_to(@wishlist)
    else
      acsessValidation
    end
  end
 
private
   def acsessValidation
      super('This wishlist it is not public.',wishlists_path)
   end
   
   def showPublicWishlist
      redirect_to :controller=>"public_wishlists", :action => "show", :id => @wishlist.id
  end
  
  def generate_visibility_list
    @visibility_list = Visibility.find :all
  end
end
