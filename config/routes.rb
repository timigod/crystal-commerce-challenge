Rails.application.routes.draw do


  resources :customers, only: [:index] do
    collection do
      get '/sideloaded', to: 'customers#sideloaded'
    end
  end

end
