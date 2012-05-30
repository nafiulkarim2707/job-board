JobBoard::Application.routes.draw do
  get "console/index", :to => 'console/dashboard#index'

  namespace :console do
    resources :dashboard
    resources :companies
  end

  devise_for :users

  root :to => "home#index"

end
