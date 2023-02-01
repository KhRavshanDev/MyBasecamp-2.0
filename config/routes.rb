Rails.application.routes.draw do
  resources :sms
  
  resources :msgs do
  resources :sms
  end
  resources :todos
  resources :pattaches
  root 'pages#index'
  get 'pages/about'
  resources :projects do
    resources :pattaches
  resources :todos
  resources :msgs
  
  

  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # delete "remove_entry" => "todos#destroy", :as => "remove_entry"
  delete "remove_entry" => "todos#destroy", :as => "remove_entry"


  # Defines the root path route ("/")
  # root "articles#index"
end
