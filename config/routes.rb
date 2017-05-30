Rails.application.routes.draw do

  get 'readings' => 'readings#readings_page'

  get 'readings/new', to: 'readings#new', as: 'new'

  resources :readings

  resources :samples

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
