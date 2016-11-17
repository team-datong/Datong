source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '~> 4.2.7'
gem 'pg', '~> 0.19'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'bootstrap', '~> 4.0.0.alpha4'
gem 'devise'

gem 'jquery-rails'
# Can use ActiveModelSerializer instead
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platform: :mri
  gem 'jasmine-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'simplecov', :require => false
  gem 'codeclimate-test-reporter', "1.0.0.pre.rc2", require: nil
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'autotest-rails'
  gem 'factory_girl_rails'
  gem 'metric_fu'
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Rails-assets-tether is supposed to make things look nicer. Look at tether.io for more information.
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# MaterializeCSS: Style choice
gem 'materialize-sass'

# Carrierwave for resource uploading
gem 'carrierwave', '~> 0.9'
gem 'bootstrap-sass', '~> 2.3.2'