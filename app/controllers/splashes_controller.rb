class SplashesController < ApplicationController
  respond_to :json

  def index
    @splashes = Splash.all

    respond_with(@splashes)
  end
  
  def show
    @splash = Splash.find_by_id(params[:id])
    respond_with(@splash)
  end
  
  def new
    @splash = Splash.new
    @splash.codes.build
    respond_with(@splash)
  end

  def edit
    @splash = Splash.find_by_id(params[:id])
  end
  
  def create
    @splash = Splash.new(params[:splash])
    flash[:notice] = 'Splash was successfully created.' if @splash.save
    respond_with(@splash)
  end
  
  def update
    @splash = Splash.find_by_id(params[:id])
    flash[:notice] = 'Splash was successfully updated.' if @splash.update_attributes(params[:splash])
    respond_with(@splash)
  end
  
  def destroy
    @splash = Splash.find_by_id(params[:id])
    flash[:notice] = 'Splash was successfully destroyed.' if @splash.destroy
    redirect_to splashes_path
  end
end
