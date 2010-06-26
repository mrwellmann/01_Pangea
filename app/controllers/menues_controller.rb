class MenuesController < InheritedResources::Base
before_filter :authenticate_admin!, :except => [:show, :index]
  
  respond_to :html, :xml
  
  def index
    @menues = Menue.find(:all, :conditions => {:visibility_id => nil} )
    index!
  end
  
  def show
    @menue = Menue.find(params[:id])
    if user_signed_in? && @menue.user_id == current_user.id
      redirect_to :controller=>"my_menues", :action => "show", :id => params[:id]
    elsif @menue.visibility_id == nil
       show!
    elsif @menue.visibility_id == Visibility.getPublic.id
      redirect_to :controller=>"custom_menues", :action => "show", :id => params[:id]
    elsif @menue.visibility_id == Visibility.getPrivate.id
      acsessValidation
    end
    
  end
  
  def new
    @menue = Menue.new
    generate_foodkind_and_foods_lists
    new!
  end
  
  def edit
    @menue = Menue.find(params[:id])    
    generate_foodkind_and_foods_lists
    edit!
  end

  def create
    params[:menue][:food_ids] ||= []#TODO waht is this for again because of uncheck?
    @menue = Menue.new(params[:menue])
    create!
  end
  
  def update
    params[:menue][:food_ids] ||= []
    @menue = Menue.find(params[:id])
    update!
  end

private
  
  def generate_foodkind_and_foods_lists
    @foodkind_list = Foodkind.find(:all)
    @foods_list = Food.find(:all, :order => "foodkind_id")
  end
  
end