# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'
  post 'search', to: 'search#index', as: 'search'
  post 'search/suggestions', to: 'search#suggestions', as: 'search_suggestions'
  resources :articles

  get 'analytics', to: 'search_logs#analytics'
end
