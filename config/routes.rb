Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'welcome/index'
   resources :admins, only: [:index, :edit, :update]
  end

  namespace :users_backoffice do
    get 'welcome/index'
  end

  devise_for :users
  namespace :site do
    get 'welcome/index'
  end
  namespace :profiles_backoffice do
    get 'welcome/index'
  end
  devise_for :admins

  root to: "site/welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
