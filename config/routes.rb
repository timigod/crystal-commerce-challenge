Rails.application.routes.draw do


  resources :customers, only: [:index] do
    collection do
      get '/sideloaded', to: 'customers#sideloaded'
      get '/sideloaded/alternate', to: 'customers#alternate_sideloaded'
    end
  end

end
