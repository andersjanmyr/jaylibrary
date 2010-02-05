class BookCopiesController < ApplicationController
  def index
    @book_copies = BookCopy.all
  end
  
  def show
    @book_copy = BookCopy.find(params[:id])
  end
  
  def new
    @book_copy = BookCopy.new
  end
  
  def create
    @book_copy = BookCopy.new(params[:book_copy])
    if @book_copy.save
      flash[:notice] = "Successfully created book copy."
      redirect_to @book_copy
    else
      render :action => 'new'
    end
  end
  
  def edit
    @book_copy = BookCopy.find(params[:id])
  end
  
  def update
    @book_copy = BookCopy.find(params[:id])
    if @book_copy.update_attributes(params[:book_copy])
      flash[:notice] = "Successfully updated book copy."
      redirect_to @book_copy
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @book_copy = BookCopy.find(params[:id])
    @book_copy.destroy
    flash[:notice] = "Successfully destroyed book copy."
    redirect_to book_copies_url
  end
end
