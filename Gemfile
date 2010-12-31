source 'http://rubygems.org'

gem 'rails', '3.0.0'

# Using rails3 branch for ActiveModel support (i.e., object.to_xml) 
gem "mongo_mapper", :git => "git://github.com/jnunemaker/mongomapper", :branch => "rails3"
gem "mongo", "1.1.5"
gem "bson_ext", "1.1.5"

# Thank FSM for Plataformatec
gem "devise", "1.1.3"
gem 'devise-mongo_mapper', :git => 'git://github.com/collectiveidea/devise-mongo_mapper'
gem "simple_form"

gem "haml"
gem "responders", "0.6.2"

gem "rqrcode"
gem "rmagick", ">= 2.0.0"

gem "compass"
gem 'hassle', :git => 'git://github.com/koppen/hassle.git'
gem 'jammit'
# group :production do
#   gem "heroku", "1.10.5"
# end
# 
group :development do
  gem "mongrel", "1.2.0.pre2"
  gem "hpricot", "0.8.2"      # Only required for 'rails g devise:views'
  gem "ruby_parser", "2.0.5"  # Only required for 'rails g devise:views'
  gem "haml-rails"     # Template generator for HAML
  gem "jquery-rails" # Template generator for jQuery
  gem 'rails3-generators'     # Template generator for Mongo Mapper
  gem "heroku"
  gem "heroku_plus"
  gem "ruby-debug19", :require => "ruby-debug"
  gem "compass"
end

group :test, :development do
  gem "simplecov"
  gem "rspec"
  gem "autotest"

  gem 'rspec-rails'
  gem 'steak'
  gem 'capybara'
  #gem 'akephalos', :git => "https://github.com/thoughtbot/akephalos.git"
  gem 'database_cleaner'

  gem 'evergreen', '0.4.0', :require => 'evergreen/rails'

  # For cucumber-rails
  # gem 'cucumber', "0.9.0"
  # gem 'spork'
  # gem 'launchy'    # So you can do Then show me the page
end

group :console do
  gem "irbtools"
end
