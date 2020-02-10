Rails.application.routes.draw do
  root to: 'top#index'
  resources :albums
  resources :posts do
    post :confirm, on: :collection
    patch 'confirm', to: 'posts#edit_confirm', on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
