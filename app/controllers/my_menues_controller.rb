class MyMenuesController < InheritedResources::Base
  before_filter :authenticate_user!
  
  respond_to :html, :xml
  
  def index
    @my_menues = Menue.find(:all, :conditions => {:user_id => current_user.id} )
    index!
  end
  
  def show
    @my_menue = Menue.find(params[:id])
    calculate_price_expirience_points#this is here because i think calculating is finishing afer redirect to show
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
    generate_foodkind_foods_visibility_lists
    new!
  end
  
  def edit
    @my_menue = Menue.find(params[:id])
    if @my_menue.user_id == current_user.id
      generate_foodkind_foods_visibility_lists
      edit!
    else
      acsessValidation
    end
  end

  def create
    generate_foodkind_foods_visibility_lists
    @my_menue = Menue.new(params[:my_menue])
    @my_menue.user_id = current_user.id
    calculate_price_expirience_points
   
    create!
  end
  
  def update
    generate_foodkind_foods_visibility_lists
    params[:my_menue][:food_ids] ||= []
    @my_menue = Menue.find(params[:id])
    if @my_menue.user_id == current_user.id
      calculate_price_expirience_points
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

  def calculate_price_expirience_points
    @my_menue.price=0
    @my_menue.expirience_points=0
    
    for food in @my_menue.foods
      @my_menue.price += food.price
      @my_menue.expirience_points += food.expirience_points
    end
  end

  def acsessValidation
    super('This is not your menue and it is not Public.', my_menues_path)
  end
  
  def generate_foodkind_foods_visibility_lists
    @foodkind_list = Foodkind.find(:all)
    @foods_list = Food.find(:all, :order => "foodkind_id")
    @visibility_list = Visibility.find :all
  end
  
end