class LoansController < ApplicationController


  def index
    user_id_or_login = params[:user_id]
    if (user_id_or_login)
      user = User.find_by_id_or_login(user_id_or_login)
      @loans = Loan.find_all_by_user_id(user.id)
    else
      @loans = Loan.all
    end
    respond_to do |format|
      format.html
      format.json {
        books = @loans.map {|loan| loan.book_copy.book}
        books.uniq!
        render :json => Book.to_full_json(books)}
    end
  end

  def show
    @loan = Loan.find(params[:id])
  end

  def new
    @loan = Loan.new
  end

  def create
    user = User.find_by_id_or_login(params[:user_id])
    copy = BookCopy.first_available params[:isbn]
    if copy
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
    else
      respond_to do |format|
        format.html {
          flash[:notice] = "No available book to loan."
          render :action => 'index'
        }
        format.json {render :json => 'No book found!'.to_json, :status => :not_found}
      end
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
    user = User.find_by_id_or_login(params[:user_id])
    @loan = Loan.first_by_user_id_and_isbn user.id, params[:isbn]
    @loan.destroy if @loan
    respond_to do |format|
      format.html {
        flash[:notice] = "Successfully destroyed loan."
        redirect_to loans_url
      }
      format.json {render :json => @loan, :status => :ok}
    end
  end
end
