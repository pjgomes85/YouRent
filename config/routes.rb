Rails.application.routes.draw do
  get 'room/index'
  get 'room/new'
  get 'room/create'
  get 'room/listing'
  get 'room/pricing'
  get 'room/description'
  get 'room/photo_upload'
  get 'room/amenities'
  get 'room/location'
  get 'room/update'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
