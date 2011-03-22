class ListenerController < ApplicationController
  skip_before_filter :verify_authenticity_token
    
  def receive_email
    user = User.find_or_initialize_by_email(User.clean_email params[:from])
    user.save!
    
    title = User.clean_email(params[:to]).gsub(/@.*$/, '')
    
    l = user.todo_lists.find_or_initialize_by_title(title)
    l.save!
    
    l.todos << l.todos.build(
      :title => params[:subject],
      :description => params[:text]
    )
    
    l.save!
    
    TodoNotifier.success(user.email).deliver
    
    render :inline => 'hello, world!'
  end
end
