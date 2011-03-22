require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "Listing Todos" do
    user = users(:one)
    get :index, :user_id => user.to_param
    
    assert_response :success
    assert_not_nil assigns(:user)
    assert_not_nil assigns(:todos)
  end
end
