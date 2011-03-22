require 'test_helper'

class ListenerControllerTest < ActionController::TestCase
  test "Posting Email New Account" do
      todo = todos(:one)
      list = todo.todo_list
      user = list.user
      
      Todo.delete_all
      User.delete_all
    
      assert_difference('Todo.count') do
        assert_difference('User.count') do
          post :receive_email, build_email(user, list, todo)
        end
      end
        
      assert_response :success
  end
  
  test "Posting Email Existing Account" do
      todo = todos(:one)
      list = todo.todo_list
      user = list.user
      
      assert_difference('Todo.count') do
        assert_difference('User.count', 0) do
          post :receive_email, build_email(user, list, todo)
        end
      end
        
      assert_response :success
  end
  
  test "Posting Email Existing Account With Long Email" do
      todo = todos(:one)
      list = todo.todo_list
      user = list.user
      
      assert_difference('Todo.count') do
        assert_difference('User.count', 0) do
          params = build_email(user, list, todo)
          params[:from] = "My Name <#{params[:from]}>"
          post :receive_email, params
        end
      end
        
      assert_response :success
  end
  
end
