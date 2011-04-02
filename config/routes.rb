Rails3Forums::Application.routes.draw do
  match 'home' => 'home#index', :as => :home

  # disallow people from creating conversations outside of forums
  #match '/conversations/*a', :to => redirect('/forums') 

  resources :conversations do
    resources :comments
  end

  resources :forums do
    resources :conversations
  end

  root :to => "home#index"

  #match '*a', :to => redirect(:root)
end
