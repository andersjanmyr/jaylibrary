require File.dirname(__FILE__) + '/../spec_helper'
 
describe BookCopiesController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Factory.create(:book_copy)
    response.should render_template(:show)
  end

  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    BookCopy.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    BookCopy.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(book_copy_url(assigns[:book_copy]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Factory.create(:book_copy)
    response.should render_template(:edit)
  end

  
  it "update action should render edit template when model is invalid" do
    book_copy = Factory.create(:book_copy)
    BookCopy.any_instance.stubs(:valid?).returns(false)
    put :update, :id => book_copy
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    book_copy = Factory.create(:book_copy)
    BookCopy.any_instance.stubs(:valid?).returns(true)
    put :update, :id => book_copy
    response.should redirect_to(book_copy_url(assigns[:book_copy]))
  end

  
  it "destroy action should destroy model and redirect to index action" do
    book_copy = Factory.create(:book_copy)
    delete :destroy, :id => book_copy
    response.should redirect_to(book_copies_url)
    BookCopy.exists?(book_copy.id).should be_false
  end
end
