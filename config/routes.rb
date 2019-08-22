Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users, except: :index 
  end
  resources :posts do
    resources :answers, except: :index do
      resources :best_answers, only: :create
    end
  end
  root 'posts#index'
end
