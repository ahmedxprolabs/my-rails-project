Rails.application.routes.draw do
  get "blogs/index"
  get "blogs/destroy"
  root "posts#index"
  resources :posts
end
