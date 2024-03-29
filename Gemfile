# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.8'

gem 'sprockets-rails'

gem 'sqlite3', '~> 1.4'

gem 'puma', '~> 5.0'

gem 'jsbundling-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'cssbundling-rails'

gem 'jbuilder'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'validates_timeliness', '~> 7.0.0.beta1'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

# Additional dependencies

gem 'chartjs-ror'
gem 'chartkick'
gem 'elasticsearch', '~> 7.17'
gem 'faker'
gem 'foreman', github: 'ddollar/foreman'
gem 'searchkick'
