require 'helper'

describe Marketplace::Request do
  let(:net_http) { mock }
  let(:uri) { URI.parse("example.com") }
  let(:request) { Marketplace::Request.new(uri) }

  describe "#http" do
    subject { request }
    before do
      Net::HTTP.stub(:new).and_return(net_http)
      Net::HTTP.should_receive(:new).and_return(net_http)
      net_http.should_receive(:use_ssl=)
      net_http.should_receive(:verify_mode=)
    end
    it { subject.http }
  end

  describe "#parameters=" do
    let(:signature_parameters) do
      [:signature, :signature_method, :signature_version]
    end

    subject { request }

    it "merges signature parameters" do
      subject.parameters.keys.should == signature_parameters
    end
  end

  describe "#query_string" do
    let(:query_string) { mock }
    subject { request }
    before do
      Marketplace::QueryString.stub(:build).and_return(query_string)
      Marketplace::QueryString.should_receive(:build)
    end
    it { subject.query_string }
  end

  describe "#submit" do
    subject { request }
    let(:query_string) { mock(path: "/foo") }
    before do
      request.stub(:query_string).and_return(query_string)
      request.stub(:http).and_return(net_http)
      net_http.should_receive(:request).with(query_string)
    end
    it { subject.submit }
  end
end
