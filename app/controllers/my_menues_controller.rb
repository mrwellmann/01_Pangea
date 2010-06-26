class MyMenuesController < InheritedResources::Base
  before_filter :authenticate_user!
  
  respond_to :html, :xml
  
  def index
    @my_menues = Menue.find(:all, :conditions => {:user_id => current_user.id} )
    index!
  end
  
  def show
    @my_menue = Menue.find(params[:id])
    if @my_menue.user_id == current_user.id
      show!    
    elsif @my_menue.visibility_id == Visibility.getPublic.id
      redirect_to :controller=>"custom_menues", :action => "show", :id => params[:id]
    elsif @my_menue.visibility_id == nil
      redirect_to :controller=>"menues", :action => "show", :id => params[:id]
    elsif @my_menue.visibility_id == Visibility.getPrivate.id
      acsessValidation
    end

  end
  
  def new
    @my_menue = Menue.new
    generate_foodkind_and_foods_lists
    new!
  end
  
  def edit
    @my_menue = Menue.find(params[:id])
    if @my_menue.user_id == current_user.id
      generate_foodkind_and_foods_lists
      edit!
    else
      acsessValidation
    end
  end

  def create
    params[:menue][:food_ids] ||= []
    @my_menue = Menue.new(params[:menue])
    @my_menue.user_id == current_user.id
    #create!

    if @my_menue.save
      flash[:notice] = 'Product was successfully .'
      redirect_to(@my_menue)
    else
      render :action => "new"
    end
  end
  
  def update
    if  params[:menue][:user_id] == current_user.id
      params[:menue][:food_ids] ||= []
      @my_menue = Menue.new(params[:menue])
      update!
    else
      acsessValidation
    end    
  end
  
  def destroy
    @my_menue = Menue.find(params[:id])
    if @my_menue.user_id == current_user.id
        destroy!
    end
  end

private
  
  def generate_foodkind_and_foods_lists#TODO try inherited from menues controler
    @foodkind_list = Foodkind.find(:all)
    @foods_list = Food.find(:all, :order => "foodkind_id")
    @visibility_list = Visibility.find :all
  end
  
end