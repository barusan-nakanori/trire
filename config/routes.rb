Rails.application.routes.draw do
  root 'homes#top'
  get "home/about", to:"homes#about"
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
    resources :users,only: [:index,:show,:edit,:update] do
      member do
      get :follower, :following
    end
    end
    resources :books do
     resources :favorites, only: [:create, :destroy]
     resources :comments, only: [:create,:destroy]
 	end
  get 'follower', to:'relationships#follower'
  get 'following', to:'relationships#following'
  post 'follow/:id', to: 'relationships#create', as:'follow'
  post 'unfollow/:id', to: 'relationships#destroy', as:'unfollow'
  get 'search', to: 'seaches#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
