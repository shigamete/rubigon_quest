Rails.application.routes.draw do
  root to: "rubigons#index"
  # get "rubigons/show_1"
  resources :rubigons do
    resources :acts, only: [:create, :edit, :update, :destroy]
  end
end
