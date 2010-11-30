class ApplicationController < ActionController::Base
  protect_from_forgery
  layout Proc.new { |controller| controller.request.xhr? ? 'ajax' : 'application' }
  
end
