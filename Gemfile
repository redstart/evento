source 'https://rubygems.org'

ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use sqlite3 as the database for Active Record
#gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
	gem 'rspec-rails', '~> 2.14.2'
	gem 'selenium-webdriver', '~> 2.42.0'
	gem 'capybara', '~> 2.4.1'
	gem 'guard-rspec', '~> 4.3.1'
	gem 'factory_girl_rails', '~> 4.4.1'
end

group :development, :production do
	gem 'populator', '~> 1.0.0'
	gem 'faker', '~> 1.4.2'
end

gem "paperclip", "~> 4.1"
gem 'devise', '~> 3.3.0'
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap', '~> 1.0.1'
gem 'pg', '~> 0.17.1'

group :production do
	gem 'rails_12factor'
end