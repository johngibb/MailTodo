class TodoListsController < ApplicationController
  before_filter :find_user
  
  def index
    @todo_lists = @user.todo_lists
  end
  
  private
  
  def find_user
    @user = User.find params[:user_id] if params.key? :user_id
    @user = User.find_by_email params[:email] if params.key? :email
    
    render 'no_user' and return if @user.nil?
  end
end