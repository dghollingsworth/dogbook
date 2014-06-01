Dogbook::Application.routes.draw do
  root 'pictures#index'
  
  resources :pictures do 
    resources :comments
  end

  
end
