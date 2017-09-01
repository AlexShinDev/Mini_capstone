Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/products' => 'products#index'
  get '/products/:id' => 'products#show'
#new and create pair
  get '/products/'
end
