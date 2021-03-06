# frozen_string_literal: true

source "https://rubygems.org"
ruby "2.6.5"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.1"

gem "actionview", ">= 5.1.6.2"
# Use postgres as the database for Active Record
gem "pg"
# Use Puma as the app server
gem "puma", "~> 3.7"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

### SCRIPTMANAGE Gems
# Use Samanage api commands
gem "samanage"
# React on Rails config if needed
gem "react_on_rails", "11.0.9"
# Resque (with the fix)
gem "resque", git: "https://github.com/resque/resque.git", ref: "2a03db682a41f47390412561ea8e7156a5d6a5fc"
# resque web
gem "resque-web", require: "resque_web"
# Figaro (protected app configs)
gem "figaro"
# Devise
gem "devise"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem "haml"

gem "paperclip"


gem "rack", ">= 2.0.6"

gem "nokogiri", ">= 1.8.5"

gem "loofah", ">= 2.2.3"

gem "scout_apm"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :test do
  gem "faker"
end
group :development, :test do
  gem "rubocop", require: false

  gem "awesome_print"
  gem "byebug"
  gem "capybara"
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "guard"
  gem "guard-rspec", require: false
  gem "rspec-rails"
  gem "rubocop-rails"

  # Adds support for Capybara system testing and selenium driver
  # gem 'capybara', '~> 2.13'
  # gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "annotate", git: "https://github.com/ctran/annotate_models.git"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "overcommit", "~> 0.51.0", group: :development
gem "rubocop-performance", "~> 1.5", group: :development

gem "bundler-audit", "~> 0.6.1", group: :development
gem "reek", "~> 5.5", group: :development
gem "rails_best_practices", "~> 1.19", group: :development

gem "brakeman", "~> 4.7", group: :development, require: false

gem "aws-sdk-s3", "~> 1.57"
