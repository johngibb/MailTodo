class ListenerController < ApplicationController
  def receive_email
    render :inline => 'hello, world!'
  end
end
