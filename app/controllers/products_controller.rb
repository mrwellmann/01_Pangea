class ProductsController < InheritedResources::Base
   #before_filter :authenticate_admin!, :except => [:show, :index]
   
   
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
    generate_lists_from_connected_tables
    new!
  end

  def edit
    @product = Product.find(params[:id])    
    generate_lists_from_connected_tables
    edit!
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

private
  
  def generate_lists_from_connected_tables
    @continent_list = Continent.find(:all, :order => "continent_name" )
  end
end
