source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.8"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use sidekiq for background processing
gem 'sidekiq', '~> 7.1'

# Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.
gem 'annotate', '~> 3.2'

# Shim to load environment variables from .env into ENV in development
gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Devise use for authentication
gem 'devise'

# The AWS SDK for integrate amazon S3 with Ruby on Rails
gem 'aws-sdk-s3', '~> 1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 11.1', '>= 11.1.3'
  gem 'rspec-rails', '~> 5.0'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

group :test do
  #Faker, a port of Data::Faker from Perl, is used to easily generate fake data.
  gem 'faker', '~> 3.2'
  # provides a framework and DSL for defining and using factories
  gem 'factory_bot', '~> 6.2', '>= 6.2.1'
  # provides integration between factory_bot and rails
  gem 'factory_bot_rails', '~> 6.2'
  #rspec-rails is a testing framework for Rails.
  gem 'rspec-rails', '~> 5.0'
end
