Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'search' => 'pages#search'

  resources :users, only: [:show]

  resources :rooms, except: [:edit] do

    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
      get 'checkout' => 'pages#checkout'
    end
    resources :reviews, only: :create
    resources :photos, only: %i[create destroy]
    resources :reservations, only: %i[create destroy]
  end
  resources :reviews, only: [:destroy]

  get '/your_trips' => 'reservations#your_trips'
  get '/your_reservations' => 'reservations#your_reservations'

end
