Rails.application.routes.draw do
  resources :backend
  post "/backend/delete" , to: "backend#delete"
  get "/frontend/store" , to: "frontend#store"
  post "/frontend/cart" , to: "frontend#cart"
  get "/frontend/cart(.:format)" , to: "frontend#cart"
  resources :frontend
  post "/frontend/delete" , to: "frontend#delete"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
