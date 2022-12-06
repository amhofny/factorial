Rails.application.routes.draw do
  resources :metrics, only: [:index, :create]
  resources :contacts

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
