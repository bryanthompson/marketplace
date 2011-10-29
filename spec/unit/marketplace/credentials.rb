require 'helper'

describe Marketplace::Credentials do
  describe ".load" do
    let(:credentials) { mock("Marketplace::Credentials") }

    subject { Marketplace::Credentials }

    before do
      Marketplace::Credentials.stub(:new).and_return(credentials)
      subject.should_receive(:new).and_return(credentials)
    end

    it "creates a new instance of itself" do
      subject.load
    end
  end

  describe ".read_from_file" do
    subject { Marketplace::Credentials.read_from_file }
    it { should be_a(Hash) }
    its(:count) { should == 4 }
  end
end
