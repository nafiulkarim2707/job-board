source 'https://rubygems.org'

gem 'rails', '3.2.3'

gem 'mongoid', '~> 3.0.0.rc'
gem 'devise'
gem 'tinymce-rails' #must not be in asset group

gem 'twitter-bootstrap-rails'
gem 'will_paginate'
gem 'unicorn'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'haml-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-rails'
  gem 'jquery-ui-rails'
end


group :development do
  gem 'rails-footnotes'
end

group :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'rspec2-rails-views-matchers'
  gem 'shoulda-matchers'
  gem 'autotest-rails'
  gem 'spork', '~> 1.0rc'
end

group :test, :development do
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'rvm'
end

group :production do
  gem 'unicorn'
end