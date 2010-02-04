class BorrowingsController < ApplicationController
  # GET /borrowings
  # GET /borrowings.xml
  def index
    @borrowings = Borrowing.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @borrowings }
    end
  end

  # GET /borrowings/1
  # GET /borrowings/1.xml
  def show
    @borrowing = Borrowing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @borrowing }
    end
  end

  # GET /borrowings/new
  # GET /borrowings/new.xml
  def new
    @borrowing = Borrowing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @borrowing }
    end
  end

  # GET /borrowings/1/edit
  def edit
    @borrowing = Borrowing.find(params[:id])
  end

  # POST /borrowings
  # POST /borrowings.xml
  def create
    @borrowing = Borrowing.new(params[:borrowing])

    respond_to do |format|
      if @borrowing.save
        flash[:notice] = 'Borrowing was successfully created.'
        format.html { redirect_to(@borrowing) }
        format.xml  { render :xml => @borrowing, :status => :created, :location => @borrowing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @borrowing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /borrowings/1
  # PUT /borrowings/1.xml
  def update
    @borrowing = Borrowing.find(params[:id])

    respond_to do |format|
      if @borrowing.update_attributes(params[:borrowing])
        flash[:notice] = 'Borrowing was successfully updated.'
        format.html { redirect_to(@borrowing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @borrowing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /borrowings/1
  # DELETE /borrowings/1.xml
  def destroy
    @borrowing = Borrowing.find(params[:id])
    @borrowing.destroy

    respond_to do |format|
      format.html { redirect_to(borrowings_url) }
      format.xml  { head :ok }
    end
  end
end
