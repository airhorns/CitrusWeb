class SplashesController < ApplicationController
  respond_to :html, :json
  
  def index
    @splashes = Splash.all

    respond_with(@splashes)
  end

  
  
  def show
    @splash = Splash.first(params[:id])
    respond_with(@splash)
  end

  
  
  def new
    @splash = Splash.new
    respond_with(@splash)
  end

  
  def edit
    @splash = Splash.first(params[:id])
  end

  
  
  def create
    @splash = Splash.new(params[:splash])
    flash[:notice] => 'Splash was successfully created.' if @splash.save
    respond_with(@splash)
  end

  
  
  def update
    @splash = Splash.first(params[:id])
    flash[:notice] = 'Splash was successfully updated.' if @splash.update(params[:splash])
    respond_with(@splash)
  end

  
  
  def destroy
    @splash = Splash.first(params[:id])
    @splash.destroy
    @splash = Splash.first(params[:id])
  end
end
