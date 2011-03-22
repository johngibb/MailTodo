Mailtodo::Application.routes.draw do
  match '/listener/receive_email' => 'listener#receive_email'
end
