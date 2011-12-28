require 'helper'

describe Marketplace::Request do
  let(:net_http) { mock }
  let(:uri) { URI.parse("example.com") }
  let(:request) { Marketplace::Request.new(uri) }
  let(:query_string) { mock }

  describe "#data" do
    let(:post) { {} }
    before do
      Net::HTTP::Post.stub(:new).and_return(post)
      request.stub(:query_string).and_return(query_string)
      Net::HTTP::Post.should_receive(:new).and_return(post)
      post.should_receive(:set_form_data)
      query_string.should_receive(:to_hash)
    end

    context "with a file" do
      before { request.body = "price,quantity" }
      it "adds an md5 to the request" do
        request.data
        post.should have_key("Content-MD5")
      end
    end
  end

  describe "#file" do
    subject { request.file }
    before { request.body = "price,quantity" }
    it { should be_a(Tempfile) }
    it "writes the body to the file" do
      subject.tap(&:rewind).read.should == "price,quantity"
    end
  end

  describe "#submit" do
    before { Net::HTTP.stub(:start).and_return(net_http) }

    it "starts a request" do
      Net::HTTP.should_receive(:start).and_return(net_http)
      request.submit
    end
  end
end
