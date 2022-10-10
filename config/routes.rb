Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  resources :users, only: [:show]

  resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
    end
    resources :photos, only: %i[create destroy]
  end
end
 