Mailtodo::Application.routes.draw do
  
  match '/listener/receive_email' => 'listener#receive_email'
  
  resources :users, :only => [] do
    resources :todo_lists, :only => :index
  end
  
  match ':email' => "todo_lists#index", :email => /.*/
  
end
