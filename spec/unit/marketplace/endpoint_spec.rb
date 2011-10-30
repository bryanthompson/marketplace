require 'helper'

describe Marketplace::Endpoint do
  describe ".all" do
    subject { Marketplace::Endpoint.all }
    it "is the entire list of endpoint urls" do 
      subject.should == [
        "https://mws.amazonservices.ca",
        "https://mws.amazonservices.de",
        "https://mws.amazonservices.fr",
        "https://mws.amazonservices.jp",
        "https://mws.amazonservices.com",
        "https://mws.amazonservices.co.uk"
      ]
    end
  end

  describe ".countries" do
    subject { Marketplace::Endpoint.countries }
    it "is the entire list of endpoint countries" do
      subject.should == [ :CA, :DE, :FR, :JP, :US, :UK ]
    end
  end
end
