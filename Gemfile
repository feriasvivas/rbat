source 'https://rubygems.org'
ruby '~> 3.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 8.0.0'
gem 'puma'
gem 'bootsnap', '>= 1.7.0'
# activesupport 5.1 requires this listen gem
gem 'listen'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# asset pipeline
gem 'sprockets-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# lock turbolinks version to avoid issues with loading cities
#gem 'turbolinks', '2.5.3'
gem 'turbolinks', '5.0.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'devise', '~> 4.9'

gem 'haml'

# file upload via ActiveStorage (built in, see db/migrate/*_create_active_storage_tables)

#role management: inline bitmask in User (see ROLES), no gem needed

# paging on server side
#gem 'kaminari'
gem 'will_paginate', '>= 3.1'

# views as excel spreadsheet
gem 'to_spreadsheet'

#
gem 'jquery-turbolinks'

# async jobs
gem 'resque', "~> 2.0"
gem 'redis', ">= 4"

gem 'pg'

group :assets do
  #gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
  gem 'jquery-ui-rails'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '>= 3.9'
  gem 'foreman'
  gem "sqlite3", ">= 1.6"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '>= 4.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers', '>= 5.0', require: false
end

group :production do
  #rails monitoring in heroku
  gem 'scout_apm'
end
