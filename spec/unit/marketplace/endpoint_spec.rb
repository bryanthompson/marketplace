require 'helper'

describe Marketplace::Endpoint do
  describe ".all" do
    subject { Marketplace::Endpoint.all }
    it "is the entire list of endpoint urls" do 
      subject.count.should == 6
    end
  end

  describe ".countries" do
    subject { Marketplace::Endpoint.countries }
    it "is the entire list of endpoint countries" do
      subject.should == %W{CA DE FR JP US UK }
    end
  end
end
