class ActionsController < ApplicationController
  respond_to :json

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

