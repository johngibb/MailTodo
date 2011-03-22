class TodoListsController < ApplicationController
  before_filter :find_user
  
  def index
    @todo_lists = @user.todo_lists
  end
  

end
