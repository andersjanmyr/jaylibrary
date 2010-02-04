require 'test_helper'

class BorrowingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:borrowings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create borrowing" do
    assert_difference('Borrowing.count') do
      post :create, :borrowing => { }
    end

    assert_redirected_to borrowing_path(assigns(:borrowing))
  end

  test "should show borrowing" do
    get :show, :id => borrowings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => borrowings(:one).to_param
    assert_response :success
  end

  test "should update borrowing" do
    put :update, :id => borrowings(:one).to_param, :borrowing => { }
    assert_redirected_to borrowing_path(assigns(:borrowing))
  end

  test "should destroy borrowing" do
    assert_difference('Borrowing.count', -1) do
      delete :destroy, :id => borrowings(:one).to_param
    end

    assert_redirected_to borrowings_path
  end
end
