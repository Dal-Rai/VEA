source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'twitter-bootstrap-rails', '~> 4.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'jquery-turbolinks'
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'dotenv-rails'
gem 'chosen-rails'


group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.4'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'database_cleaner'
  gem 'pry'
  gem 'simplecov'
  gem 'faker'
  gem 'vcr'
  gem 'webmock'
  gem 'parallel_tests'
end

# commit doesnt work for Testing
# gem 'test_after_commit', :group => :test

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
  #gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

gem 'whenever', :require => false
gem 'devise'
gem 'jwt'
gem 'devise_invitable', '~> 1.7.0'
gem 'aasm'
gem 'kaminari'
gem 'pundit'
gem 'capybara'
gem 'paperclip'
gem 'bootstrap-sass'
gem 'bcrypt'
gem 'redis', '~> 3.2'
gem 'rack-cors'
gem 'selenium-webdriver'

gem "shoulda-whenever", "~> 0.0.2"
gem 'local_time'
gem 'rubyzip', '= 1.0.0'
gem 'axlsx', '= 2.0.1'
gem 'axlsx_rails'
gem 'draper'

# gem 'sunspot_rails'
# gem 'sunspot_solr'
gem 'elasticsearch-model', github: 'elastic/elasticsearch-rails', branch: 'master'
gem 'elasticsearch-rails', github: 'elastic/elasticsearch-rails', branch: 'master'
gem 'searchkick'
gem 'paypal-recurring'
gem 'tire'

#chat
gem 'clearance', '~> 1.16'
gem 'delayed_job_active_record'

#ml recommendation
gem 'eps'

#validation
gem 'nifty-generators'
gem 'client_side_validations'

#Pagination
#gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
# gem 'jquery-ui-rails'

