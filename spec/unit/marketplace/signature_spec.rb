require 'helper'

describe Marketplace::Signature do
  let(:signature) { Marketplace::Signature.new('abc', '/foo') }

  describe "#encode" do
    subject { signature.encode }

    it "base64 encodes the digest" do
      subject.should == "4xE5WFa02Lbqw8aTv3qcipyy96Y="
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
