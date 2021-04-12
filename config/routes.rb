Rails.application.routes.draw do
  root 'cards#index'
  resources 'cards', only: [:index, :new, :create]
  get 'cards/:id/:status', to: 'cards#update', as: 'update_card'

end
