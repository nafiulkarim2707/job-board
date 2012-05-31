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
