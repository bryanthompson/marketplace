require 'helper'

describe Marketplace::ListOrder do
  describe ".new" do
    let(:list_order) { Marketplace::ListOrder.new }
    context "validations" do
      context "when created_after is not present" do
        subject { list_order.valid? }
        before { list_order.created_at = nil }
        it { should be_false }
      end

      context "when created_after is present" do
        subject { list_order.valid? }
        before { list_order.created_at = Time.parse("01/01/2011") }
        it { should be_true }
      end

    end
  end
end
