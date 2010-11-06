class CodesController < ApplicationController
  respond_to :html, :json
  
  def shortcode
    @code = Code.find_by_shortcode(params[:shortcode])
    if @code
      redirect_to splash_path(@code.splash, {:format => self.formats.first})
    else
      raise MongoMapper::DocumentNotFound
    end
  end
end
