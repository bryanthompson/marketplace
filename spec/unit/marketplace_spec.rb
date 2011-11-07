require 'helper'

describe "Marketplace" do
  describe ".request" do
    subject { Marketplace }
    before { Marketplace::Resource.should_receive(:build).with({}) }
    it { subject.request(:get, {}) }
  end
end
