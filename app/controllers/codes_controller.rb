class CodesController < ApplicationController
  respond_to :html, :json
  
  def shortcode
    @code = Code.find_by_shortcode(params[:shortcode])
    redirect_to splash_path(@code.splash, {:format => self.formats.first})
  end
end