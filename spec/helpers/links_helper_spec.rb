require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the LinksHelper. For example:
#
# describe LinksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe LinksHelper do
 
  describe "#time" do
    it "displays formatted date" do
      link = mock_model(Link, :created_at => Time.parse("2011-04-09 17:49:00"))
      helper.time(link).should == "Apr 09 2011, 05:49 PM"
    end
  end  
  
  describe "#box" do
    it "displays paragraph" do
      helper.box { "Hello!"}.should == %[<p class="box">Hello!</p>]
    end
  end
end
