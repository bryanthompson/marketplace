require 'helper'

describe "Requests" do
  describe "gets" do
    let(:url) { "http://example.com" }
    let(:method) { :get }
    it_behaves_like "a request"
  end

  describe "posts" do
    let(:url) { "http://example.com/" }
    let(:method) { :post }
    it "posts" do
      pending
    end
  end
end
