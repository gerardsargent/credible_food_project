Rails.application.routes.draw do

  # get '/readings', to: 'readings#index'
  # post '/readings', to: 'readings#create'
  # get '/readings/new', to: 'readings#new', as: 'new_page_page'
  # get '/readings/:id', to: 'readings#show', as: 'page'
  # get '/readings/:id/edit', to: 'readings#edit', as: 'edit_page'
  # patch '/readings/:id', to: 'readings#update'
  # delete '/readings/:id', to: 'readings#destroy'

  resources :readings do
    resources :samples
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
