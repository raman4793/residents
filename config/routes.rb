Rails.application.routes.draw do
  resources :complaints
  resources :blogs
  resources :photos
  root 'pages#index'
  resources :notifications, only: [:index]

  devise_for :association_admins, controllers: {
      registrations: 'association_admins/registrations',
      sessions: 'association_admins/sessions'
  }
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :bloods

  devise_for :member, controllers: {
      sessions: 'members/sessions'
  }, :skip => [:registrations, :passwords]

  post '/new_message', to: 'messages#create_cm'

  match '/residence_associations', to: 'residence_associations#index', as: 'residence_associations_index_path', via: [:get]

  constraints subdomain: /.+/ do
    resources :messages
    resources :events
    resources :houses
    resources :residence_associations
    resources :conversations do
    end
    devise_for :members, controllers: {
        registrations: 'members/registrations',

    }, :skip => [:sessions]
  end

  get '/my_blogs/:id', to: 'blogs#mblog', as: 'my_blogs'

  get '/complain', to: 'messages#complain'

  get '/associations', to: 'residence_associations#index'

  get 'pages/about'

  get 'pages/contact'

  get 'pages/search'

  get 'index', to: 'members#index', constraints: {:subdomain => /.+/}

  # get 'report', to: 'admins#report'

  post 'pages/search', to: 'pages#search'

  # put 'approve', to: 'admins#approve', constraints: {:subdomain => 'admin'}

  get '/login', to: 'pages#login'
  resources :members, only: [:index, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
