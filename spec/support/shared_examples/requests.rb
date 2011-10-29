shared_examples_for "a request" do
  let(:method) { :get }
  let(:url) { "http://mws.amazonservices.com" }

  subject { a_request(method, url) }
  before { stub_request(method, url) }

  context "with a url" do
    before { Marketplace.get(url: url) }

    it "visits the urls" do
      should have_been_made
    end
  end
end

