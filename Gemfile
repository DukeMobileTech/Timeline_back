# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'jbuilder', '~> 2.9', '>= 2.9.1'
gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.0.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'faker', '~> 2.2', '>= 2.2.2'
end

group :development do
  gem 'annotate', '~> 2.7', '>= 2.7.5'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rb-readline', '~> 0.5.5'
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
