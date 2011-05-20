require 'spec_helper'

describe Link do


  context "validations" do
      #### http://solnic.eu/2011/01/14/custom-rspec-2-matchers.html
      ####  before { subject.url = 'http-://google.com' }
      ####  it { should have_errors_on(:url) }
      ####  it { should have_errors_on(:url).with_message("is invalid") }
      ####  it { should_not be_valid }

      #mocha
      it "should raise" do
        subject.stub(:age).and_raise("Not implementeds")
        expect { subject.age }.to raise_error("Not implementeds")
      end

      #####  # mock com Rspec
      #####  it "should initialize link" do
      #####    Link.should_receive(:new).with(:url=>"http://google.com").and_return(subject)
      #####    Link.new :urls=>"http://google.com"
      #####  end
      # Mock com Mocha
      it "should initialize link" do
        subject.should_receive(:new).with(:url => "http://google.com").and_return(subject)
        subject.new :url => "http://google.com"
        #expect {subject.url}.to should  be_eql('http://google.com')
      end


      it "requires url" do
        subject.url = nil
        subject.should_not be_valid
      end
      
      it "rejects invalid url" do
        subject.url = 'invalid'
        subject.should_not be_valid  
      end
      
      it "passes when all attributes are valid" do
        subject.attributes = {:url => 'http://google.com'}
        subject.should be_valid
      end
      
    end
  
    it "shortens id" do
      subject.stub :id => 1234
      subject.to_short.should == "16i"
    end
    
    it "overrides #to_params" do
       subject.stub :id => 1234
       subject.to_param.should == subject.to_short
    end
    
  
  



####### context 'when have invalid attributes' do
#######  before do
#######    subject.attributes = {:url => 'http-://google.com'}
#######  end
#######  specify {  subject.should_not be_valid }
####### end 
####### 
####### context 'when have valid attributes' do
#######  before do
#######    subject.attributes = {:url => 'http://google.com'}
#######  end
#######  specify {  subject.should be_valid }
####### end 
#######  
#######  
#######  specify { [1,2,3].should have(3).items }
  
end
