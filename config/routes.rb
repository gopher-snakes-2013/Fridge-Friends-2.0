FridgeFriends20::Application.routes.draw do
  # root to: fridges_path

  resources :fridges, only: [:index, :create, :show, :destroy] do
    resources :items, only: [:index, :create, :show, :destroy]
  end

end
