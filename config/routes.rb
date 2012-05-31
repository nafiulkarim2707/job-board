JobBoard::Application.routes.draw do
  get "console/index", :to => 'console/dashboard#index'
  get '/c/:company_name/:job_title', :to => 'public/jobs#by_friendly_name', :as => 'friendly_job'

  namespace :console do
    root :to => 'dashboard#index'
    resources :dashboard
    resources :companies
    match '/jobs/clone/:id', :to => 'jobs#duplicate', :as => 'duplicate_job'
    resources :jobs

  end

  devise_for :users

  root :to => "public/jobs#index"

  scope '/widget' do
     match "job_list" => "widget#job_list", :as => "job_list_wiget"
  end

  resources :companies do
    resources :jobs, :only => [:index, :show]
  end

  namespace :public do
    resources :jobs, :only => [:index, :show]
  end

end
