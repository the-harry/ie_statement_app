# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.0'

gem 'dotenv-rails', groups: %i[development test]

gem 'rails', '~> 7.1.2'

gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.0'
gem 'devise'
gem 'importmap-rails'
gem 'jbuilder'
gem 'mini_racer'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'brakeman'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'shoulda-matchers', '~> 6.0'
  gem 'simplecov'
end
