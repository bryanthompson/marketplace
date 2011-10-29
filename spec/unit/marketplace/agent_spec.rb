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

  describe ".post" do
    subject { Marketplace::Agent }
    before { Net::HTTP.should_receive(:post_form).with(uri, {}) }

    it "gets the http request" do
      subject.post(uri, {})
    end
  end
end
