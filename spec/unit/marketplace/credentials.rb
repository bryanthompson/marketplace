require 'helper'

describe Marketplace::Credentials do
  describe "#new" do
    subject { Marketplace::Credentials }

    it "is a singleton" do
      expect { subject.new }.to raise_error(NoMethodError) 
    end
  end

  describe ".read_from_file" do
    subject { Marketplace::Credentials.read_from_file }
    it { should be_a(Hash) }
    its(:count) { should == 4 }
  end
end
