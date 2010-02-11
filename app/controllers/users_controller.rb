class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def login
  end

  def authenticate
    theParams = params[:userform]
    user = User.find_by_login(theParams["login"])
    if user
      session[:user_id]=user.login
      redirect_to "/"
    else
      flash[:notice] = "Unknown user: " + theParams["login"]
      redirect_to :action => 'new'
    end
  end

  def logout
    if session[:user_id]
        reset_session
        redirect_to :action=> 'login'
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
end
