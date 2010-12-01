class CodesController < ApplicationController
  respond_to :html, :json
 
  def new
    @splash = Splash.new
    @code = @splash.codes.build
    respond_with @code
  end

  def shortcode
    @code = Code.find_by_shortcode(params[:shortcode])
    if @code
      redirect_to splash_path(@code.splash, {:format => self.formats.first})
    else 
      render :nothing => true, :status => 404
    end
  end

  def image
    @code = Code.find_by_id(params[:code_id])
  	if @code
      headers['Cache-Control'] = 'public; max-age=2592000' # cache image for a month
      send_data @code.qr(params[:size].to_i).to_blob, :filename => @code.filename, :disposition => 'inline', :type => "image/png"
    else
      render :nothing => true, :status => 404
    end
  end  
end
