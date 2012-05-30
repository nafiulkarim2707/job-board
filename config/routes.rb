JobBoard::Application.routes.draw do
  get "console/index", :to => 'console/dashboard#index'

  namespace :console do
    root :to => 'dashboard#index'
    resources :dashboard
    resources :companies
    resources :jobs

  end

  devise_for :users

  root :to => "home#index"

  scope '/widget' do
     match "job_list" => "widget#job_list", :as => "job_list_wiget"
  end

  namespace :public do
    resources :jobs, :only => [:index]
  end
end
