Rails.application.routes.draw do
  root to: 'balance#index'
  get "/balance/gym_info"
  get "/balance/classes_info"
  get "/balance/contact_info"
  get "/status", to: "balance#status"
  get "/findmyklasses/:user_id", to: "balance#findmyklasses"
  resources :klasses #, param: :_username
  resources :users #, param: :_username
  post 'klass_enroll', to: 'user_klasses#create'
  post 'klass_unenroll', to: 'user_klasses#destroy'
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
#  resources :users, except: [:destroy]
#  post "login", to: 'login#create'
#  delete "logout", to: 'login#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
