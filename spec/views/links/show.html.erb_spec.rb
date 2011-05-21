require "spec_helper"

describe "links/show.html.erb" do

  # with mock
  #let(:link) do 
  #  mock_model(Link, :to_short => "16i", :url => "http://example.com")
  #end
  
  #with factorie
  let(:link) { Factory(:link) }

  # with method 
  #def create_link(options = {})
  #  Link.create options.reverse_merge(:url => "http://example.com")
  #end  
  # with method
  #let(:link) { create_link }
   
  before do
    assign(:link, link)
    render    
  end
  
  
  it "display original link" do
    rendered.should contain("http://example.com")    
  end
  
  it "displays shortened link" do
    rendered.should contain("http://test.host/shortlink.#{link.to_param}") #with method
  end
  
end
