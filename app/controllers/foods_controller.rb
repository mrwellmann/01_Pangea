class FoodsController < InheritedResources::Base
  before_filter :authenticate_admin!, :except => [:show, :index]
  respond_to :html, :xml
  
  def index
   @foods = Food.find :all, :order => "foodkind_id"
   index! 
  end
  
  def new
    generate_continent_foodkind_lists
    new!
  end

  def edit
    generate_continent_foodkind_lists   
    edit!
  end
  
  def create
    generate_continent_foodkind_lists
    create!
  end
  
  def update
    generate_continent_foodkind_lists
    update!
  end

  
private

  def generate_continent_foodkind_lists
    @continent = Continent.getAllByName
    @foodkind = Foodkind.getAllByName
  end
end
