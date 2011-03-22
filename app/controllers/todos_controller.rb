class TodosController < ApplicationController
  
  before_filter :find_user, :find_todo_list
  
  def index
    
  end
  
  private
  
  def find_todo_list
    @todo_list = @user.todo_lists.find params[:todo_list_id] if params.key? :todo_list_id
    @todo_list = @user.todo_lists.find_by_title params[:todo_list] if params.key? :todo_list
  end
end
