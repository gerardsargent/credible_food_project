Rails.application.routes.draw do

  #get 'readings' => 'readings#readings_page'
  get 'readings_page', to: 'readings#readings_page', as: 'readings'

  get 'readings/new', to: 'readings#new', as: 'new'

  get 'readings/show', to: 'readings#show', as: 'show'

  delete 'readings/:id', to: 'readings#destroy'

  resources :readings

  resources :samples

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
