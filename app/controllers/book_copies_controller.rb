class BookCopiesController < ApplicationController
  # GET /book_copies
  # GET /book_copies.xml
  def index
    @book_copies = BookCopy.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @book_copies }
    end
  end

  # GET /book_copies/1
  # GET /book_copies/1.xml
  def show
    @book_copy = BookCopy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book_copy }
    end
  end

  # GET /book_copies/new
  # GET /book_copies/new.xml
  def new
    @book_copy = BookCopy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book_copy }
    end
  end

  # GET /book_copies/1/edit
  def edit
    @book_copy = BookCopy.find(params[:id])
  end

  # POST /book_copies
  # POST /book_copies.xml
  def create
    @book_copy = BookCopy.new(params[:book_copy])

    respond_to do |format|
      if @book_copy.save
        flash[:notice] = 'BookCopy was successfully created.'
        format.html { redirect_to(@book_copy) }
        format.xml  { render :xml => @book_copy, :status => :created, :location => @book_copy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book_copy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /book_copies/1
  # PUT /book_copies/1.xml
  def update
    @book_copy = BookCopy.find(params[:id])

    respond_to do |format|
      if @book_copy.update_attributes(params[:book_copy])
        flash[:notice] = 'BookCopy was successfully updated.'
        format.html { redirect_to(@book_copy) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book_copy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /book_copies/1
  # DELETE /book_copies/1.xml
  def destroy
    @book_copy = BookCopy.find(params[:id])
    @book_copy.destroy

    respond_to do |format|
      format.html { redirect_to(book_copies_url) }
      format.xml  { head :ok }
    end
  end
end
