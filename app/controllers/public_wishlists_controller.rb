class PublicWishlistsController < InheritedResources::Base
  
  respond_to :html, :xml,  :only => [:index,:show]
  
  def index
    if user_signed_in?
      @public_wishlists = Wishlist.find(:all, :conditions => 
        ["user_id NOT IN (?) AND visibility_id IN (?) AND products_wishlists.wishlist_id NOT IN (?)",
        current_user.id,Visibility.getPublic.id,:id],:include =>:products )
        
    else 
      @public_wishlists = Wishlist.find(:all, :conditions => 
        ["visibility_id IN (?) AND products_wishlists.wishlist_id NOT IN (?)",
        Visibility.getPublic.id,:id],:include =>:products )
    end
    index!
  end
  
  def show
    @public_wishlist = Wishlist.find(params[:id])
    if user_signed_in?
      if @public_wishlist.user_id == current_user.id
        showPrivateWishlist
        return
      elsif @public_wishlist.visibility == Visibility.getPublic
        show!
        return
      elsif @public_wishlist.visibility == Visibility.getPrivate
        acsessValidation
        return
      end
    end
  end

private
   def acsessValidation
     super('This wishlist it is not Public.',public_wishlists_path)
   end
   
   def showPrivateWishlist
      redirect_to :controller=>"wishlists", :action => "show", :id => @public_wishlist.id
   end
end