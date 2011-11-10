require 'helper'

describe Marketplace::Signature do
  let(:signature) { Marketplace::Signature.new('abc') }

  describe "#encode" do
    subject { signature.encode }

    it "base64 encodes the digest" do
      subject.should == "gm36fWF2D0WK0JshKJhW7PvjCkI="
    end

    context "with newline characters" do
      it { should_not include("\n") }
    end
  end

  describe ".method" do
    subject { Marketplace::Signature.method }
    it { should == "HmacSHA1" }
  end

  describe ".version" do
    subject { Marketplace::Signature.version }
    it { should == "2" }
  end
end
