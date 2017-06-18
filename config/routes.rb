Rails.application.routes.draw do
  resources :readings
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :samples
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'home/index'

  get 'home/login'

  root to: "readings#index"
end
