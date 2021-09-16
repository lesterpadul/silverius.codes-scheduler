Rails.application.routes.draw do
  get 'auth/twitter/callback' => "omniauth_callbacks#twitter"
  post 'scheduled_tweets/send' => "scheduled_tweets#send_tweet"
  resources :scheduled_emails
  resources :scheduled_tweets
  devise_for :users
  root 'home#index'
end
