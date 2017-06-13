Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  get 'home/index'

  get 'home/login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
