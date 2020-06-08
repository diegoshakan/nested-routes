Rails.application.routes.draw do
  root to: "home#index"
  resources :tasks do
    resources :comments
  end
end
