class FoodsController < InheritedResources::Base
  before_filter :authenticate_admin!, :except => [:show, :index]
  respond_to :html, :xml
  

  def new
    @food = Food.new
    edit_new
    new!
  end

  def edit
    @food = Food.find(params[:id])    
    edit_new
    edit!
  end

  
private

  def edit_new
    @continent = Continent.find(:all, :order => "continent_name" )
    @foodkind = Foodkind.find(:all, :order => "foodkind_name" )
  end
end
