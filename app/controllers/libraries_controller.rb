class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end
  
  def show
    @library = Library.find(params[:id])
  end
  
  def new
    @library = Library.new
  end
  
  def create
    @library = Library.new(params[:library])
    if @library.save
      flash[:notice] = "Successfully created library."
      redirect_to @library
    else
      render :action => 'new'
    end
  end
  
  def edit
    @library = Library.find(params[:id])
  end
  
  def update
    @library = Library.find(params[:id])
    if @library.update_attributes(params[:library])
      flash[:notice] = "Successfully updated library."
      redirect_to @library
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @library = Library.find(params[:id])
    @library.destroy
    flash[:notice] = "Successfully destroyed library."
    redirect_to libraries_url
  end
end
