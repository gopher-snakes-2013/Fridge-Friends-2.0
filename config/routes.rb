FridgeFriends20::Application.routes.draw do

  match '/users' => 'users#create'
  put '/users/:id/update/texts' => 'users#update_text_alerts'
  
  constraints Clearance::Constraints::SignedOut.new do
    root to: 'clearance/sessions#new'
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'fridges#index'
    resources :fridges, only: [:index, :create, :show, :destroy] do
      member do
        post :add_user
        post :remove_user
      end
      resources :items, only: [:index, :create, :show, :destroy] do
        member do
          post :add_to_fridge_from_list
        end
      end
      resources :grocery_lists, only: [:create, :show, :destroy] do
        post '/items', to: 'items#create_grocery_list_item'
        delete '/items/:id', to: 'items#destroy_grocery_list_item', as: 'item'
      end
    end
    resources :recipe_queries, only: [:index, :create, :show, :destroy] do
      resources :recipes, only: [:index, :create, :show, :destroy] do
        member do
          post :add_recipe_to_user
        end
      end
    end
  end
end