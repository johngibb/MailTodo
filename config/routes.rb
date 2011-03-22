Mailtodo::Application.routes.draw do
  
  match '/listener/receive_email' => 'listener#receive_email'
  
  resources :users, :only => [] do
    resources :todo_lists, :only => :index do
      resources :todos, :only => :index
    end
  end
  
  match ':email/:todo_list' => "todos#index", :email => /.*/
  match ':email' => "todo_lists#index", :email => /.*/
  
end
