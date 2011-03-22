class TodosController < ApplicationController
  before_filter :find_user
  
  def index
    @todos = @user.todos
  end
  
  private
  
  def find_user
    @user = User.find params[:user_id] if params.key? :user_id
  end

end
