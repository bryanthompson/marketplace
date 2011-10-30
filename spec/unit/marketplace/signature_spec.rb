require 'helper'

describe Marketplace::Signature do
  let(:signature) { Marketplace::Signature.new('abc') }

  describe "#digest" do
    subject { signature.digest }

    it "creates a HMAC digest" do
      subject.should == "\xCCG\xE3\xC0\xAA\f)\x84EDv\xD0a\x10\x8C\v\x11\x01w\xAE"
    end
  end

  describe "#encode!" do
    subject { signature.encode! }

    it "base64 encodes the digest" do
      subject.should == "zEfjwKoMKYRFRHbQYRCMCxEBd64="
    end

    context "with newline characters" do
      it { should_not include("\n") }
    end
  end

  describe "#method" do
    subject { signature.method }
    it { should == "HmacSHA1" }
  end

  describe "#version" do
    subject { signature.version }
    it { should == "2" }
  end
end
