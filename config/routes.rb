Rails.application.routes.draw do
  root to: "rubigons#index"
  resources :rubigons do
    resources :acts, only: [:create, :edit, :update, :destroy]
  end
end
