class MenuesController < InheritedResources::Base

  respond_to :html, :xml
  
   def new
    @foodkind_list = Foodkind.find(:all, :order => "id")
    @foods_of_foodkind = Food.find(:all, :order => "foodkind_id")
    @menue = Menue.new

    @blub
    
    #new!

end

#  def add_food (food)
#    
#  end

  def create
    @menue = Menue.new(params[:menue])
    #@product.continent = Continent.find(params[:product]["continent_id"]) #is her because forgotten to add attr_accessible continent_id
    #@menue.add_food 
    create!
#    if @product.save
#      flash[:notice] = 'Product was successfully created.'
#      redirect_to(@product)
#    else
#      render :action => "new"
#    end
  end

  
end