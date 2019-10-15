# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'activerecord-import', '~> 1.0', '>= 1.0.3'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'discard', '~> 1.1'
gem 'jb', '~> 0.7.0'
gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.0.0'

group :development, :test do
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

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
