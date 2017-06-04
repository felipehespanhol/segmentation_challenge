Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  resources :contacts
  resources :segments

  root 'contacts#index'
end
