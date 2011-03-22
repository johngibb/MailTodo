class ListenerController < ApplicationController
  skip_before_filter :verify_authenticity_token
    
  def receive_email
    user = User.find_or_create_by_email!(params[:from])
    
    Todo.create!(
      :user => user,
      :title => params[:subject],
      :description => params[:html]
    )
    
    render :inline => 'hello, world!'
  end
end
