JobBoard::Application.routes.draw do
  get "console/index", :to => 'console/dashboard#index'

  namespace :console do
    root :to => 'dashboard#index'
    resources :dashboard
    resources :companies
    match '/jobs/clone/:id', :to => 'jobs#duplicate', :as => 'duplicate_job'
    resources :jobs

  end

  devise_for :users

  root :to => "jobs#index"

  scope '/widget' do
     match "job_list" => "widget#job_list", :as => "job_list_wiget"
  end

  resources :companies do
    resources :jobs, :only => [:index, :show]
  end

  match '/jobs/:slug/:id', :to => 'jobs#show', :as => 'job_details'

  resources :jobs, :only => [:index]

end
