class ApplicationController < ActionController::Base
  protect_from_forgery
  layout Proc.new { |controller| controller.request.xhr? ? 'ajax' : 'application' }
  before_filter do
    @available_action_types ||= Splash.available_actions.collect {|x|
      [x.name.split('::')[1..-1].map(&:titleize).join(" -> "), x]
    }
  end 
end
