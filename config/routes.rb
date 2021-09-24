Rails.application.routes.draw do
  resources :user_profiles
  get 'auth/twitter/callback' => "omniauth_callbacks#twitter"
  get 'auth/github/callback' => "omniauth_callbacks#github"
  post 'scheduled_tweets/send' => "scheduled_tweets#send_tweet"
  post 'scheduled_emails/send' => "scheduled_emails#send_email"
  resources :scheduled_emails
  resources :scheduled_tweets
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'scheduled_tweets#index'
  
  # name space API
  namespace :api do
    get '/donation_history/:user_id' => 'donations#donation_history'
    resources :users
    resources :message_groups
    resources :messages
    resources :donations
  end
  
  # name space API
  namespace :message_view do
    get '/inbox' => "inbox#index"
    get '/profile/:id' => "inbox#profile"
  end
end
