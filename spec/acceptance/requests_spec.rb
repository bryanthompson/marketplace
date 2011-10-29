require 'helper'

describe "Requests" do
  describe "gets" do
    let(:method) { :get }
    it_behaves_like "a request"
  end
end
