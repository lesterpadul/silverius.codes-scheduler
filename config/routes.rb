Rails.application.routes.draw do
  resources :scheduled_emails
  resources :scheduled_tweets
  devise_for :users
  root 'home#index'
end
