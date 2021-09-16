Rails.application.routes.draw do
  get 'auth/twitter/callback' => "omniauth_callbacks#twitter"
  resources :scheduled_emails
  resources :scheduled_tweets
  devise_for :users
  root 'home#index'
end
