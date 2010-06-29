class ProductsController < InheritedResources::Base
   before_filter :authenticate_admin!, :except => [:show, :index, :update,:add_to_wishlist]
   
   
   #optional_belongs_to :continent
   #belongs_to :continent
   respond_to :html, :xml
   
   
#geting done by inherited_resources so cracy   

  def index
    if user_signed_in? #TODO: complete _product.html.erb
      @wishlists = Wishlist.findAllOwedByUser(current_user.id)
    end
    @products = Product.find :all
    index!
  end

  def show
    if user_signed_in?
      @wishlists = Wishlist.findAllOwedByUser(current_user.id)    
    end
    @product = Product.find(params[:id])
    show!
  end
 
  def new
    @product = Product.new
    generate_continent_list
    new!
  end

  def edit
    generate_continent_list#need to be here if ther is an imput error
    @product = Product.find(params[:id])    
    edit!
  end
  
  def update
    generate_continent_list#need to be here if ther is an imput error
    @product = Product.find(params[:id])
    update!
  end

  def add_to_wishlist
    if user_signed_in?
      @product = Product.find(params[:id])
      @wishlists = Wishlist.find(params[:product][:wishlist_ids])
      
      for wischlist in @wishlists
        unless wischlist.products.exists?(@product)
          wischlist.products<<@product
        end
      end
      
      if @wishlists.size == 1
        redirect_to @wishlists[0]
      else
        redirect_to wishlists_path
      end  
    end
  end
 
private
  def generate_continent_list
    @continent_list = Continent.getAllByName
  end
end

=begin
  def create
    @product = Product.new(params[:product])
    #@product.continent = Continent.find(params[:product]["continent_id"]) #is her because forgotten to add attr_accessible continent_id

    create!
#    if @product.save
#      flash[:notice] = 'Product was successfully created.'
#      redirect_to(@product)
#    else
#      render :action => "new"
#    end
  end

  def update
    @product = Product.find(params[:id])
    #@product.continent = Continent.find(params[:product]["continent_id"])
    
    update!
#    if @product.update_attributes(params[:product])
#      flash[:notice] = 'Product was successfully updated.'
#      redirect_to(@product)
#    else
#      render :action => "edit"
#    end
  end

#  def destroy
#    @product = Product.find(params[:id])
#    @product.destroy
#    redirect_to(products_url)
#  end
=end



