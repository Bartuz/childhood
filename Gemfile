source 'https://rubygems.org'
ruby '1.9.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record

gem 'bourbon'

group :development, :test do
	gem 'sqlite3'
end


# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails', '~> 4.0.0'

gem 'uglifier', '>= 1.0.3'

gem 'jquery-rails'

gem 'jquery-ui-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :production, :staging do
  gem "pg"
end

group :production do
  gem 'rails_12factor'
end