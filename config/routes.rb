Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
    resources :subjects
    resources :questions
  end

  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end

  devise_for :users

  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    post 'answer', to: 'answer#question'
    get 'search_subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
  end
  namespace :profiles_backoffice do
    get 'welcome/index'
  end
  
  devise_for :admins, :skip => [:registrations]

  root to: "site/welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
