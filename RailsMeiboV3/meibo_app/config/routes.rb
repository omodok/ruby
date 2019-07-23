Rails.application.routes.draw do
  devise_for :users
  resources :meibos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "meibos#index"
  post "/meibos/delete" , to: "meibos#delete"
end
