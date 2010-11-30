class ActionsController < ApplicationController
  respond_to :html, :json
  before_filter do
    @available_action_types = Splash.available_actions.collect {|x|
      [x.name.split('::')[1..-1].map(&:titleize).join(" -> "), x]
    }
    true
  end 
  def new
    @splash = Splash.new
    begin
      type = params[:type].constantize
    rescue StandardError
      render :nothing, :status => 404
    else
      @action = type.new
      @splash.actions << @action
      respond_with @action
    end
  end
 
end

