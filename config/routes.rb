JobBoard::Application.routes.draw do
  devise_for :users

  root :to => "home#index"

  scope '/widget' do
     match "job_list" => "widget#job_list", :as => "job_list_wiget"
  end
end
