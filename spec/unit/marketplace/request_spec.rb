require 'helper'

describe Marketplace::Request do
  let(:net_http) { mock }
  let(:uri) { URI.parse("example.com") }
  let(:request) { Marketplace::Request.new(uri) }

  describe "#data" do
    subject { request }
    before do
      Net::HTTP::Post.stub(:new).and_return(net_http)
      Net::HTTP::Post.should_receive(:new).and_return(net_http)
      net_http.should_receive(:set_form_data)
    end
    it { subject.data }
  end

  describe "#submit" do
    subject { request }
    before do
      Net::HTTP.stub(:start).and_return(net_http)
      Net::HTTP.should_receive(:start).and_return(net_http)
    end
    it { subject.submit }
  end
end
