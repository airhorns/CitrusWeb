require 'spec_helper'

describe "splashes/show.html.haml" do
  before(:each) do
    @splash = assign(:splash, stub_model(Splash,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
