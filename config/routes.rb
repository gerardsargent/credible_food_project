Rails.application.routes.draw do

  get 'readings' => 'readings#readings_page'

  resources :readings

  resources :samples

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
