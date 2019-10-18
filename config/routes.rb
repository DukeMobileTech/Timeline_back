# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :participants, format: 'json'
  resources :interviews, format: 'json'
  resources :events, format: 'json'
end
