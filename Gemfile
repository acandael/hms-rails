source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'
# Use postgreSQl as the database for Active Record
gem 'pg'
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
gem 'jquery-ui-rails', '~> 5.0.4'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

group :development do
  gem 'capistrano-rails', '~> 1.1.3'
  gem 'bullet'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end
#
# Sass tools
gem 'bourbon', '~> 4.2.2'
gem 'neat', '~> 1.7.2'

gem 'normalize-rails'
gem 'sitemap_generator', '~> 5.0.5'

# Font Awesome
gem 'font-awesome-rails', '~> 4.3.0.0'

#seo friendly urls
gem 'friendly_id', '~> 5.1.0'

# file uploading
gem "mini_magick"
gem 'refile', '~> 0.5.4', require: ["refile/rails", "refile/image_processing"]
gem "aws-sdk", '< 2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'


  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.3.6'

  gem 'rspec-rails', '~> 3.2.1'
  gem 'bundler-audit'
  gem 'brakeman', :require => false
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rails', '~> 0.3.2'
end

group :test do
  gem 'capybara', '~> 2.4.4'
  gem 'launchy', '~> 2.4.3'
  gem 'shoulda-matchers', '~> 2.8.0'
end

