Rails.application.routes.draw do


root to: "ideas#index"

  resources :ideas do
    resources :likes, only: [:create, :destroy]
    resources :ratings
      end

  resources :users, only: [:new, :create] do
    resources :likes, only: [:index]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
