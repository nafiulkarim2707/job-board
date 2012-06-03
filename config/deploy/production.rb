set :rails_env,             'production'
set :domain,                "www.aawaj.com:10022"
role :web,                  domain.to_s
role :app,                  domain.to_s
role :db,                   domain.to_s,    :primary => true
set :branch, 'master'

after 'deploy:update' do
  # restart nginx h3110w0r1d
  #run "cd #{current_path} && #{try_sudo} /etc/init.d/nginx restart"
end

namespace :util do

  namespace :unicorn do
    desc 'Start unicorn server'
    task :start do
      run "cd #{current_path} && bundle exec unicorn_rails -E #{stage.to_s} -p 8181 -D"
    end

    desc 'Stop unicorn server'
    task :stop do
      run "cd #{current_path} && cat tmp/pids/unicorn.pid | xargs -I% kill -9 % ; true"
    end
  end
end

after 'deploy', 'util:unicorn:stop', 'util:unicorn:start'
