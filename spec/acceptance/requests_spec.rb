require 'helper'

describe "Requests" do
  subject { a_request(:get, url) }
  before { stub_request(:get, url) }

  context "with a url" do
    let(:url) { "http://mws.amazonservices.com" }
    before { Marketplace.get(url: url) }

    it "visits the urls" do
      should have_been_made
    end
  end
end
