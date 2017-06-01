Rails.application.routes.draw do

  # resources :readings

  #post 'readings_page', to: 'readings#create'

 # get 'readings' => 'readings#readings_page'

  #get 'readings_page', to: 'readings#readings_page' #, as: 'readings'

  #get 'readings/new', to: 'readings#new', as: 'new'

  #get 'readings/show', to: 'readings#show', as: 'show'

  #delete 'page/:id', to: 'readings#destroy'
  
  get '/readings', to: 'readings#readings_page'
  post '/readings', to: 'readings#create'
  get '/readings/new', to: 'readings#new', as: 'new_page'
  get '/readings/:id', to: 'readings#show', as: 'page'
  get '/readings/:id/edit', to: 'readings#edit', as: 'edit_page'
  patch '/readings/:id', to: 'readings#update'
  delete '/readings/:id', to: 'readings#destroy'

  resources :samples

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
