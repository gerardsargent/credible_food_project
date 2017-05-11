Rails.application.routes.draw do

  resources :readings do
    resources :samples
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
