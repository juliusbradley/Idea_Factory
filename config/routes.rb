Rails.application.routes.draw do


root to: "ideas#index"

  resources :ideas do
    resources :ratings
      end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
