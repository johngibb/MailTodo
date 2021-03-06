class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def find_user
    @user = User.find params[:user_id] if params.key? :user_id
    @user = User.find_by_email params[:email] if params.key? :email
    
    render 'no_user' and return if @user.nil?
  end
end
