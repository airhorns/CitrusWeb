require 'spec_helper'

describe SplashesController do

  def mock_splash(stubs={})
    (@mock_splash ||= mock_model(Splash).as_null_object).tap do |splash|
      splash.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all splashes as @splashes" do
      Splash.stub(:all) { [mock_splash] }
      get :index
      assigns(:splashes).should eq([mock_splash])
    end
  end

  describe "GET show" do
    it "assigns the requested splash as @splash" do
      Splash.stub(:first).with("37") { mock_splash }
      get :show, :id => "37"
      assigns(:splash).should be(mock_splash)
    end
  end

  describe "GET new" do
    it "assigns a new splash as @splash" do
      Splash.stub(:new) { mock_splash }
      get :new
      assigns(:splash).should be(mock_splash)
    end
  end

  describe "GET edit" do
    it "assigns the requested splash as @splash" do
      Splash.stub(:first).with("37") { mock_splash }
      get :edit, :id => "37"
      assigns(:splash).should be(mock_splash)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created splash as @splash" do
        Splash.stub(:new).with({'these' => 'params'}) { mock_splash(:save => true) }
        post :create, :splash => {'these' => 'params'}
        assigns(:splash).should be(mock_splash)
      end

      it "redirects to the created splash" do
        Splash.stub(:new) { mock_splash(:save => true) }
        post :create, :splash => {}
        response.should redirect_to(splash_url(mock_splash))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved splash as @splash" do
        Splash.stub(:new).with({'these' => 'params'}) { mock_splash(:save => false) }
        post :create, :splash => {'these' => 'params'}
        assigns(:splash).should be(mock_splash)
      end

      it "re-renders the 'new' template" do
        Splash.stub(:new) { mock_splash(:save => false) }
        post :create, :splash => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested splash" do
        Splash.should_receive(:first).with("37") { mock_splash }
        mock_splash.should_receive(:update).with({'these' => 'params'})
        put :update, :id => "37", :splash => {'these' => 'params'}
      end

      it "assigns the requested splash as @splash" do
        Splash.stub(:first) { mock_splash(:update => true) }
        put :update, :id => "1"
        assigns(:splash).should be(mock_splash)
      end

      it "redirects to the splash" do
        Splash.stub(:first) { mock_splash(:update => true) }
        put :update, :id => "1"
        response.should redirect_to(splash_url(mock_splash))
      end
    end

    describe "with invalid params" do
      it "assigns the splash as @splash" do
        Splash.stub(:first) { mock_splash(:update => false) }
        put :update, :id => "1"
        assigns(:splash).should be(mock_splash)
      end

      it "re-renders the 'edit' template" do
        Splash.stub(:first) { mock_splash(:update => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested splash" do
      Splash.should_receive(:first).with("37") { mock_splash }
      mock_splash.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the splashes list" do
      Splash.stub(:first) { mock_splash }
      delete :destroy, :id => "1"
      response.should redirect_to(splashes_url)
    end
  end

end
