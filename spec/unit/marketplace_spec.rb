require 'helper'

describe "Marketplace" do
  describe ".call" do
    subject { Marketplace }
    before { Marketplace::Resource.should_receive(:build).with(nil) }
    it { subject.call(:get, {}) }
  end
end
