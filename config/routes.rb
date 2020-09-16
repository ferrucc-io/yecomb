Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'entry#new'
  get '/success', to: 'entry#success'
  post '/', to: 'entry#create'
  get '/entries', to: 'entry#index'
  get '/entry/:id', to: 'entry#show'
  resources :questions, only: %i[index create]
end
