require 'spec_helper'

describe "splashes/edit.html.haml" do
  before(:each) do
    @splash = assign(:splash, stub_model(Splash,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit splash form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => splash_path(@splash), :method => "post" do
      assert_select "input#splash_name", :name => "splash[name]"
    end
  end
end
