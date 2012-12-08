class GiftsController < ApplicationController
  # GET users/1/gifts
  # GET users/1/gifts.json
  def index
    @user = User.find(params[:user_id])
    @gifts = @user.gifts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @gifts }
    end
  end

  # GET users/1/gifts/1
  # GET users/1/gifts/1.json
  def show
    @user = User.find(params[:user_id])
    @gift = @user.gifts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @gift }
    end
  end

  # GET users/1/gifts/new
  # GET users/1/gifts/new.json
  def new
    @user = User.find(params[:user_id])
    @gift = @user.gifts.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @gift }
    end
  end

  # GET users/1/gifts/1/edit
  def edit
    @user = User.find(params[:user_id])
    @gift = @user.gifts.find(params[:id])
  end

  # POST users/1/gifts
  # POST users/1/gifts.json
  def create
    @user = User.find(params[:user_id])
    @gift = @user.gifts.build(params[:gift])

    respond_to do |format|
      if @gift.save
        format.html { redirect_to([@gift.user, @gift], :notice => 'Gift was successfully created.') }
        format.json { render :json => @gift, :status => :created, :location => [@gift.user, @gift] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @gift.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT users/1/gifts/1
  # PUT users/1/gifts/1.json
  def update
    @user = User.find(params[:user_id])
    @gift = @user.gifts.find(params[:id])

    respond_to do |format|
      if @gift.update_attributes(params[:gift])
        format.html { redirect_to([@gift.user, @gift], :notice => 'Gift was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @gift.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE users/1/gifts/1
  # DELETE users/1/gifts/1.json
  def destroy
    @user = User.find(params[:user_id])
    @gift = @user.gifts.find(params[:id])
    @gift.destroy

    respond_to do |format|
      format.html { redirect_to user_gifts_url(user) }
      format.json { head :ok }
    end
  end
end
