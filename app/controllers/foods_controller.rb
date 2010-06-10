class FoodsController < InheritedResources::Base
  #before_filter :authenticate_admin!, :except => [:show, :index]
  respond_to :html, :xml
  

  def new
    @food = Food.new
    connected_tables
    new!
  end

  def edit
    @food = Food.find(params[:id])    
    connected_tables
    edit!
  end

  
private

  def connected_tables
    @continent = Continent.find(:all, :order => "continent_name" )
    @foodkind = Foodkind.find(:all, :order => "foodkind_name" )
  end
end
