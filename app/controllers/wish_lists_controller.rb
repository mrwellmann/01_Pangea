class WishListsController < ApplicationController
  # GET /wish_lists
  # GET /wish_lists.xml
  def index
    @wish_lists = WishList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wish_lists }
    end
  end

  # GET /wish_lists/1
  # GET /wish_lists/1.xml
  def show
    @wish_list = WishList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wish_list }
    end
  end

  # GET /wish_lists/new
  # GET /wish_lists/new.xml
  def new
    @wish_list = WishList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wish_list }
    end
  end

  # GET /wish_lists/1/edit
  def edit
    @wish_list = WishList.find(params[:id])
  end

  # POST /wish_lists
  # POST /wish_lists.xml
  def create
    @wish_list = WishList.new(params[:wish_list])

    respond_to do |format|
      if @wish_list.save
        flash[:notice] = 'WishList was successfully created.'
        format.html { redirect_to(@wish_list) }
        format.xml  { render :xml => @wish_list, :status => :created, :location => @wish_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wish_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wish_lists/1
  # PUT /wish_lists/1.xml
  def update
    @wish_list = WishList.find(params[:id])

    respond_to do |format|
      if @wish_list.update_attributes(params[:wish_list])
        flash[:notice] = 'WishList was successfully updated.'
        format.html { redirect_to(@wish_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wish_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wish_lists/1
  # DELETE /wish_lists/1.xml
  def destroy
    @wish_list = WishList.find(params[:id])
    @wish_list.destroy

    respond_to do |format|
      format.html { redirect_to(wish_lists_url) }
      format.xml  { head :ok }
    end
  end
end
