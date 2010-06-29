class CustomMenuesController < InheritedResources::Base
  
  respond_to :html, :xml, :only => [ :index, :show ]
  
  def index
#    if user_signed_in?
#      @custom_menues = Menue.find(:all, :conditions => 
#        ["user_id NOT IN (?) AND visibility_id IN (?)",
#        current_user.id,Visibility.getPublic.id])
#    else
      @custom_menues = Menue.find(:all, :conditions => {:visibility_id => Visibility.getPublic.id})
#    end
    index!
  end
  
  def show
    @custom_menue = Menue.find(params[:id])
    if user_signed_in? && @custom_menue.user_id == current_user.id
      redirect_to :controller=>"my_menues", :action => "show", :id => params[:id]   
    elsif @custom_menue.visibility_id == Visibility.getPublic.id
      show!
    elsif @custom_menue.visibility_id == nil
      redirect_to :controller=>"menues", :action => "show", :id => params[:id]
    elsif @custom_menue.visibility_id == Visibility.getPrivate.id
      acsessValidation
    end
  end

private

  def acsessValidation
    super('This is not your menue and it is not Public.',custom_menues_path)
  end  
end