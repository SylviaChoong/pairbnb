source 'https://rubygems.org'



# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise'
gem 'omniauth-facebook'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem "braintree"
gem 'gon', '~> 5.1.2'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'searchkick'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem "mini_magick"
gem "figaro"
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
    gem 'byebug'
    gem 'sqlite3'
    gem 'guard'
    gem 'guard-rspec'
    gem 'guard-puma'
    gem 'rspec'
    gem 'rspec-rails'
    gem 'shoulda-matchers'
    gem 'factory_girl_rails'
    gem 'shoulda-callback-matchers'

    # For developer's code improvements
    gem 'colored'
    gem 'traceroute'
    gem 'rails_best_practices'
    # gem 'rubocop'
    gem 'rubycritic'
    gem 'brakeman'
    gem 'bullet'
    gem 'rack-mini-profiler'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
    gem 'rails', '4.2.5'
    # Use postgresql as the database for Active Record
    gem 'pg', '~> 0.15'
    gem 'rails_12factor'
    gem 'puma'
end
