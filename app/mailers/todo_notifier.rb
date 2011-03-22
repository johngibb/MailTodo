class TodoNotifier < ActionMailer::Base
  default :from => "from@example.com"
  
  def success(email)
    recipients [email]
    from       "MailTodo"
    subject    "#{email} todo list added."
    sent_on    Time.now
    @email = email
  end
end
