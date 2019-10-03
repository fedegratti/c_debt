source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.2'
gem 'puma', '~> 3.7'

#activeadmin
gem 'activeadmin', '~> 1.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bootstrap-sass', '~> 3.3.0.1'
gem 'bootstrap-material-design'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3', '>= 1.3.11'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'better_errors'
end

group :production do
  #postgresql
  gem 'pg', '~> 0.18'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data'

gem 'rails_12factor', group: :production
gem 'omniauth-facebook'
gem 'dotenv-rails', groups: [:development, :test]
gem 'sidekiq'
gem 'whenever', :require => false
gem 'whenever-test'
gem 'rails-controller-testing'
gem 'codecov', :require => false, :group => :test
gem 'omniauth-twitter'
gem 'activerecord-session_store'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
