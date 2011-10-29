require 'helper'

describe "Marketplace" do
  describe ".get" do
    let(:params) { { url: nil } }
    subject { Marketplace }
    before { Marketplace::Resource.should_receive(:build).with(params) }
    it { subject.get(params) }
  end
end
