Rails.application.routes.draw do
  get 'auth/twitter/callback' => "omniauth_callbacks#twitter"
  get 'auth/github/callback' => "omniauth_callbacks#github"
  post 'scheduled_tweets/send' => "scheduled_tweets#send_tweet"
  post 'scheduled_emails/send' => "scheduled_emails#send_email"
  resources :scheduled_emails
  resources :scheduled_tweets
  devise_for :users
  root 'scheduled_tweets#index'
  
  # name space API
  namespace :api do
    resources :users
  end
end
