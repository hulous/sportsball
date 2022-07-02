source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails", "~> 6.0.4.8"

# Postgres
gem "pg", "1.2.3"

# gem "bootstrap", require: false
gem "dotenv-rails"
gem "jbuilder"
gem "jquery-rails"
gem "net-smtp"
gem "puma"
# gem "sass-rails"
gem "turbolinks"
gem 'webpacker'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap"
gem "psych", "< 4"

group :development, :test do
  gem "annotate", require: false
  gem "brakeman", require: false
  gem "byebug", platforms: :mri, require: false
  gem "factory_bot", require: false
  gem "fasterer", require: false
  gem "ffaker", require: false
  gem "rails-erd", require: false
  gem "reek", require: false
  gem "rspec-rails", require: false
  gem "rubocop", "~> 1.0", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# This app components:
gem 'app_component', path: 'components/app_component'
