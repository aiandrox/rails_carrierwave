Rails.application.routes.draw do
  root to: 'top#index'
  resources :albums
  resources :posts do
    collection do
      post :confirm
    end
    patch 'confirm', to: :edit_confirm, on: :member, as: :confirm
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
