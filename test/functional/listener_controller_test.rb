require 'test_helper'

class ListenerControllerTest < ActionController::TestCase
  test "Posting Email New Account" do
      todo = todos(:one)
      user = todo.user
      
      Todo.delete_all
      User.delete_all
    
      assert_difference('Todo.count') do
        assert_difference('User.count') do
          post :receive_email, email_from_todo(user, todo)
        end
      end
        
      assert_response :success
  end
  
  test "Posting Email Existing Account" do
      todo = todos(:one)
      user = todo.user
      
      assert_difference('Todo.count') do
        assert_difference('User.count', 0) do
          post :receive_email, email_from_todo(user, todo)
        end
      end
        
      assert_response :success
  end
  
end
