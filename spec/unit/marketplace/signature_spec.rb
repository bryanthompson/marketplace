require 'helper'

describe Marketplace::Signature do
  let(:signature) { Marketplace::Signature.new('abc', '/foo') }

  describe "#sign!" do
    subject { signature.sign! }

    it "base64 encodes the digest" do
      subject.should == "9WNB0zwiu4bx7UjZbcmkft48YtRrfClsjFyV049ialU="
    end

    context "with newline characters" do
      it { should_not include("\n") }
    end
  end

  describe ".method" do
    subject { Marketplace::Signature.method }
    it { should == "HmacSHA256" }
  end

  describe ".version" do
    subject { Marketplace::Signature.version }
    it { should == "2" }
  end
end
