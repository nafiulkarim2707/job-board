JobBoard::Application.routes.draw do
  get "static/(:page)", :to => 'static#index', :as => 'static_page'

  namespace :console do
    root :to => 'dashboard#index'
    resources :dashboard
    resources :companies

    resources :jobs do
      get 'clone', :to => 'jobs#duplicate', :as => 'duplicate'
    end

    resources :pages

    get "/index", :to => 'dashboard#index'
    get "/clearcache", :to => 'console#clear_all_cache'

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

  namespace :employer do
    root :to => 'dashboard#index'
    get 'company', :to => 'companies#manage', :as => 'manage_company'
    post 'company', :to => 'companies#create', :as => 'manage_company'
    put 'company', :to => 'companies#update', :as => 'update_company'

    resources :jobs do
      get 'clone', :to => 'jobs#duplicate', :as => 'duplicate'
    end


  end

end
