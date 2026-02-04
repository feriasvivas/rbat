source 'https://rubygems.org'
ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
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

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'devise'

gem 'haml'

#file upload
gem "refile", require: "refile/rails"
gem "refile-mini_magick"

#role management
gem 'easy_roles'

# paging on server side
#gem 'kaminari'
gem 'will_paginate', '~> 3.1.0'

# views as excel spreadsheet
gem 'to_spreadsheet'

#
gem 'jquery-turbolinks'

# async jobs
# 1.27.4 is the last version before 2.x where support for ruby < 2.3 and rails < 4 was dropped
# 2.x adds support for redis 4. So, let's also force redis < 4 here for compliance.
# the major reason is that Redis.connect was dropped in favor of Redis.new
gem 'resque', "~> 1.27.4"
gem 'redis', "< 4"

gem 'pg'

gem 'loofah', '~> 2.19.1'

group :assets do
  #gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
  gem 'jquery-ui-rails'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0'
  gem 'foreman'
  gem "sqlite3", "~> 1.3.6"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers', '~> 2.8', require: false
end

group :production do
  gem 'rails_12factor'
  #gem 'pg'
  #rails monitoring in heroku
  gem 'scout_apm'
end
