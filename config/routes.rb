# frozen_string_literal: true

Rails.application.routes.draw do
  resources :participants, format: 'json'
  resources :interviews, format: 'json'
  resources :events, format: 'json'
end
