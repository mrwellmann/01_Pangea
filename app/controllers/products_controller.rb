class ProductsController < InheritedResources::Base
   before_filter :authenticate_admin!, :except => [:show, :index]
   
   
   #optional_belongs_to :continent
   #belongs_to :continent
   respond_to :html, :xml
   
   
#geting done by inherited_resources so cracy   

#  def index
#    @products = Product.find :all
#  end
#
#  def show
#    @product = Product.find(params[:id])
#  end
 
  def new
    @product = Product.new
    @continent = Continent.find(:all, :order => "continent_name" )
    new!
  end

  def edit
    @product = Product.find(params[:id])    
    @continent = Continent.find(:all, :order => "continent_name" )
    edit!
  end
=begin
  def create
    @product = Product.new(params[:product])
    #@product.continent = Continent.find(params[:product]["continent_id"])

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
  
end
