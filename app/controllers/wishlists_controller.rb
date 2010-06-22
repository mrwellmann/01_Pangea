class WishlistsController < InheritedResources::Base
  before_filter :authenticate_user! , :except => [:show, :index]
  
  respond_to :html, :xml
  
  def index
    @wishlists = Wishlist.find :all, :conditions => { :user_id => current_user.id}
    index!
  end
  
  def show
    @wishlist = Wishlist.find(params[:id])
    if @wishlist.user_id == current_user.id
      show!
    elsif @wishlist.visibility == Visibility.getPublic
      showPublicWishlist
    elsif @wishlist.visibility == Visibility.getPrivate
      acsessValidation
    end
  end  
  
  def new
    @wishlist = Wishlist.new
    @visibility_list = Visibility.find :all
    new!
  end
  
  def edit
    @wishlist = Wishlist.find(params[:id])
    if @wishlist.user_id == current_user.id
      @visibility_list = Visibility.find :all
      edit!
    else
      acsessValidation
    end
    
  end
  
  def create
    @wishlist = Wishlist.new(params[:wishlist])
    @wishlist.user_id = current_user.id
    create!{wishlists_path}
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
      flash[:notice] = 'Acsess validation! This is not your wishlist and it is not Public.'
      redirect_to wishlists_path
   end
   
   def showPublicWishlist
      redirect_to :controller=>"public_wishlists", :action => "show", :id => @wishlist.id
   end
end
