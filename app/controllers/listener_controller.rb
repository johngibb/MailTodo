class ListenerController < ApplicationController
  skip_before_filter :verify_authenticity_token
    
  def receive_email
    user = User.find_or_initialize_by_email(User.clean_email params[:from])
    user.save!
    
    Todo.create!(
      :user => user,
      :title => params[:subject],
      :description => params[:text]
    )
    
    render :inline => 'hello, world!'
  end
end
