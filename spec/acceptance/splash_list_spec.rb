require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')
feature "Splash List" do
  scenario "Whatever" do
    visit homepage
    within(:css, "div#app") do
      page.should have_css('#new_button')
    end
  end
end
