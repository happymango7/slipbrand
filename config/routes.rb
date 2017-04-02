Rails.application.routes.draw do
    mount Payola::Engine => '/payola', as: :payola

    namespace :admin do
      resources :users
      resources :campaigns
      resources :categories
      resources :influencers
      resources :placements
      resources :plans 
      root to: "users#index"
    end 

    match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]

    root 'pages#index'

    devise_for :users, controllers: { registrations: "registrations", confirmations: "confirmations" }
  	devise_scope :user do
      put 'change_plan', :to => 'registrations#change_plan'
    end
 
  	resources :influencers
  	resources :categories
  	resources :campaigns do
      member do 
        get 'remove_influencer/:influencer_id', to: 'campaigns#remove_influencer', :as => :remove_influencer
      end
    end

    resources :onboarding
    resources :plans

    match '/influencer-signup' => "pages#sign_up", via: :get

  	match "/campaigns/:influencer_id/" => "campaigns#add_influencer", via: :post
    match "/campaigns/:campaign_id/message/:influencer_id" => "campaigns#messaged", via: :post

  	match '/dashboard' => 'pages#dashboard', via: :get
  	match '/search' => 'search#index', via: :get
    match '/discover' => 'search#index', via: :get
    match '/contact' => 'pages#contact', via: :get
    match '/privacy' => 'pages#privacy', via: :get
    match '/terms' => 'pages#terms', via: :get
    match '/security' => 'pages#security', via: :get
end
    