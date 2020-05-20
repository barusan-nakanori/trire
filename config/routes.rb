Rails.application.routes.draw do
  root 'homes#top'
  get "home/about", to:"homes#about"
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
    resources :users,only: [:index,:show,:edit,:update]
    resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
