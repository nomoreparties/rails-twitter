Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets do
    post :like
    post :retweet

    resources :replies
  end
  resources :users, only: [:show]

  resources :replies do
    resources :replies
  end

  resources :follows do
    post :follow
    post :unfollow
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
