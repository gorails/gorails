Rails.application.routes.draw do
  resources :social_network_types
  resources :winners
  get 'activities/index'

  mount Commontator::Engine => '/commontator'
  resources :images
  resources :albums
  resources :links, :path=>"links" do
    collection do
      get 'uteis'
    end
  end
  resources :gifts
  resources :link_categories
  resources :partners
  resources :events, path: 'eventos' do
    post :register, on: :member
    collection { post 'register' }
    resources :registrations, controller: 'event_registrations'
  end
  resources :attachments
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks" }
  resources :users, :only => [:show]

  get "/paginas/:pagina" => "paginas#show"
  root "paginas#show", pagina: "home"
  get 'contact', to: 'messages#new', as: 'contact'
  post 'messages/subscribe', to: 'messages#subscribe'
  post 'contact', to: 'messages#create'
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  match "/422" => "errors#error422", via: [ :get, :post, :patch, :delete ]
  match "/500" => "errors#error500", via: [ :get, :post, :patch, :delete ]
end
