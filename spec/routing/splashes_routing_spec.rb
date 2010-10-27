require "spec_helper"

describe SplashesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/splashes" }.should route_to(:controller => "splashes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/splashes/new" }.should route_to(:controller => "splashes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/splashes/1" }.should route_to(:controller => "splashes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/splashes/1/edit" }.should route_to(:controller => "splashes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/splashes" }.should route_to(:controller => "splashes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/splashes/1" }.should route_to(:controller => "splashes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/splashes/1" }.should route_to(:controller => "splashes", :action => "destroy", :id => "1")
    end

  end
end
