require 'helper'

describe Marketplace::Agent do
  let(:uri) { URI.parse("http://google.com/") }

  describe ".get" do
    subject { Marketplace::Agent }
    before { Net::HTTP.should_receive(:get).with(uri) }

    it "gets the http request" do
      subject.get(uri, {})
    end
  end

  describe ".request" do
    subject { Marketplace::Agent.request(uri, {}) }

    it "sends the http request" do
      subject.should be_a(Marketplace::Request)
    end
  end
end
