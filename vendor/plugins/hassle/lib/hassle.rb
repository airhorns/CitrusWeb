module HassleRails
  class Railtie < Rails::Railtie
    initializer :after_initialize do
      require 'rack'
      require 'sass'
      require 'sass/plugin'

      if (ENV.include?('HEROKU_UPID'))
        require File.dirname(__FILE__) + '/hassle/hassle'
        if defined? Rails.configuration && defined? Rails.configuration.middleware
          Rails.configuration.middleware.use(Hassle)
        elsif defined? ActionController::Dispatcher && defined? ActionController::Dispatcher.middleware
          ActionController::Dispatcher.middleware.use Hassle
        end
        require File.dirname(__FILE__) + '/hassle/actionview'
      end
    end
  end
end
