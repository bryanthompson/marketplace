require 'helper'

describe "Marketplace" do
  describe ".get" do
    subject { Marketplace }
    before { Marketplace::Resource.should_receive(:build).with(nil) }
    it { subject.get(nil) }
  end
end
