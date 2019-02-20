# frozen_string_literal: true

Rails.application.routes.draw do
  resources :purchases, only: %i[index show] do
    collection { post :import }
  end
  root to: 'purchases#index'
end
