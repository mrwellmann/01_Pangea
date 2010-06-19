class MenuesController < InheritedResources::Base
  before_filter :check_somebody_logged_in , :except => [:show, :index]
  
  respond_to :html, :xml
  
  def index
    generate_lists_from_connected_tables
    index!
  end
  
  def new
    @menues = Menue.new
    generate_lists_from_connected_tables
    new!
  end
  
  def edit
    @menues = Menue.find(params[:id])    
    generate_lists_from_connected_tables
    edit!
  end

  def create
    params[:menue][:food_ids] ||= []
    @menues = Menue.new(params[:menue])
    create!
  end
  
  def update
    params[:menue][:food_ids] ||= []
    @menues = Menue.find(params[:id])
    update!
  end

private
  
  def generate_lists_from_connected_tables
    @foodkind_list = Foodkind.find(:all)
    @foods_list = Food.find(:all, :order => "foodkind_id")
  end
  
end