require 'capistrano/ext/multistage'
require 'rvm/capistrano'
require 'bundler/capistrano'

set :rvm_ruby_string, 'ruby-1.9.3-p194@job-board'
set :rvm_type, :user
default_run_options[:pty] = true

set :stages, %w(staging production)
set :default_stage, "production"

set :application, "jobboard"
set :deploy_to, lambda { "/home/jobboard/#{stage}" }
set :user, "jobboard"
set :scm, :git
set :scm_verbose, true
set :deploy_via, :remote_cache
#set :deploy_via, :copy
#set :scm, 'none'
#set :repository, '.'
set :repository, "git://github.com/rajuru/job-board.git"
set :branch, "master"
set :runner, user

#set :use_sudo, true

namespace :util do
  desc 'Symblink mongo configuration'
  task :symlink_mongo_config do
    #run "cd #{current_path} && ln -s #{shared_path}/config/mongoid.yml #{current_path}/config/mongoid.yml"
  end


  desc 'Assets precompile'
  task :assets_precompile do
    run "cd #{current_path} && rake assets:precompile RAILS_ENV=#{stage.to_s}"
  end


end

after 'deploy:update', 'util:symlink_mongo_config', 'util:assets_precompile'