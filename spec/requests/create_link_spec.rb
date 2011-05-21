require 'spec_helper'

#describe "create link" do
#  before do
#    visit "/link/new"
#    fill_in "Url", :with => "http://localhost:3000"
#    click_button "Shorten"   
#  end
#  
#end

describe "Create link" do
  before do
    visit "/links/new"
    #save_and_open_page #=> save response in /tmp and open in browser
    fill_in "url", :with => "http://localhost:3000"
    click_button "Shorten"
  end

#  it "displays message" do
#    response.body.should contain("Here's your new shortened url!")
#  end

  it "redirects to the show page" do
    request.fullpath.should match(%r[/links/[a-zA-Z0-9]+])
  end

  it "displays original link" do
    response.body.should contain("http://localhost:3000")
  end

  it "displays shortened link" do
    response.body.should match(%r[http://www.example.com/[a-zA-Z0-9]+])
  end
end

