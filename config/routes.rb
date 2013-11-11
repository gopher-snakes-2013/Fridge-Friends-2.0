FridgeFriends20::Application.routes.draw do

  match '/users' => 'users#create'
  put '/users/:id/update' => 'users#update'
  constraints Clearance::Constraints::SignedOut.new do
    root to: 'clearance/sessions#new'
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'fridges#index'
    resources :fridges, only: [:index, :create, :show, :destroy] do
      member do
        post :add_user
      end
      resources :items, only: [:index, :create, :show, :destroy]
      resources :grocery_lists, only: [:index, :create, :show] do
        resources :items, only: [:index, :create, :destroy]
      end
    end
  end
end