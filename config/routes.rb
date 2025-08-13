# Rails.application.routes.draw do
#   resources :posts, constraints: { id: /\d+/ } do
#     # Member route
#     member do
#       get "preview"
#     end

#     resources :comments, shallow: true
#   end
# end
# get "/new", to: "posts#new", as: "formss"  (named routes)
Rails.application.routes.draw do
  root "toys#index"
  resources :toys do
    collection do
      get :helpers_demo
    end
  end
end
