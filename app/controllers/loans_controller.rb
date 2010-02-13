class LoansController < ApplicationController
  def index
    if (params[:user_id])
      user = User.find_by_login params[:user_id]
      @loans = Loan.find_all_by_user_id(user.id)
    else
      @loans = Loan.all
    end
    respond_to do |format|
      format.html
      format.json {render :json => "[#{@loans.map {|loan| loan.book_copy.book.to_full_json }.join(',')}]" }
    end
  end

  def show
    @loan = Loan.find(params[:id])
  end

  def new
    @loan = Loan.new
  end

  def create
    user = User.find_by_login params[:user_login]
    copy = BookCopy.first_available params[:isbn]
    
    @loan = Loan.new(:user_id => user.id, :book_copy_id => copy.id)
    if @loan.save
      respond_to do |format|
        format.html {
            flash[:notice] = "Successfully created loan."
            redirect_to @loan
          }
        format.json {render :json => @loan, :status => :created, :location => loan_url(@loan)}
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def update
    @loan = Loan.find(params[:id])
    if @loan.update_attributes(params[:loan])
      flash[:notice] = "Successfully updated loan."
      redirect_to @loan
    else
      render :action => 'edit'
    end
  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy
    flash[:notice] = "Successfully destroyed loan."
    redirect_to loans_url
  end
end
