class ListenerController < ApplicationController
  skip_before_filter :verify_authenticity_token
    
  def receive_email
    user = User.find_or_initialize_by_email(params[:from])
    user.save!
    
    Todo.create!(
      :user => user,
      :title => params[:subject],
      :description => params[:html]
    )
    
    render :inline => 'hello, world!'
  end
end
