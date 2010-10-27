require 'spec_helper'

describe "splashes/new.html.haml" do
  before(:each) do
    assign(:splash, stub_model(Splash,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new splash form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => splashes_path, :method => "post" do
      assert_select "input#splash_name", :name => "splash[name]"
    end
  end
end
