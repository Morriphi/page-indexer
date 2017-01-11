Rails.application.routes.draw do
  get '/pages', to: 'pages#index'
  post '/pages', to: 'pages#create'
end
