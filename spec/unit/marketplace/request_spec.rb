require 'helper'

describe Marketplace::Request do
  let(:net_http) { mock }
  let(:uri) { URI.parse("example.com") }
  let(:request) { Marketplace::Request.new(uri) }

  describe "#submit" do
    subject { request }
    before do
      Net::HTTP.stub(:start).and_return(net_http)
      Net::HTTP.should_receive(:start).and_return(net_http)
    end
    it { subject.submit }
  end

  describe "#query_string" do
    let(:query_string) { mock }
    subject { request }
    before do
      Marketplace::QueryString.stub(:new).and_return(query_string)
      Marketplace::QueryString.should_receive(:new)
    end
    it { subject.query_string }
  end
end
