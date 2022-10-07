Rails.application.routes.draw do
  # get 'room/index'
  # get 'room/new'
  # get 'room/create'
  # get 'room/listing'
  # get 'room/pricing'
  # get 'room/description'
  # get 'room/photo_upload'
  # get 'room/amenities'
  # get 'room/location'
  # get 'room/update'
  devise_for :users
  root to: "pages#home"


  resources :users, only: [:show]

  resources :room, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenties'
      get 'location'
    end
  end
end
