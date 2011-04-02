Rails3Forums::Application.routes.draw do
  match 'home' => 'home#index', :as => :home

  resources :conversations do
    resources :comments
  end

  resources :forums do
    resources :conversations
  end

  root :to => "home#index"

  # route all unmatched routes to root
  #match '*a', :to => redirect(:root)
end
