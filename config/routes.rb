Rails.application.routes.draw do
  resources :contacts
  resources :segments

  root 'contacts#index'
end
