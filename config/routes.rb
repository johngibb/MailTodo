Mailtodo::Application.routes.draw do
  
  match '/listener/receive_email' => 'listener#receive_email'
  
  resources :users, :only => [] do
    resources :todos, :only => :index
  end
  
  match '/users/:email/todos' => "todos#index", :email => /.*/
  
end
