require 'helper'

describe Marketplace::ListOrder do
  let(:list_order) { Marketplace::ListOrder.new({}) }

  describe ".new" do
    context "validations" do
      subject { list_order }

      context "when created_after is not present" do
        before { list_order.created_after = nil }
        it { should_not be_valid }
      end

      context "when created_after is present" do
        before { list_order.created_after = Time.parse("01/01/2011") }
        it { should be_valid }
      end

      context "last updated after is present and created_after is not" do
        before do
          list_order.created_after = nil
          list_order.last_updated_after = Time.parse("01/01/2011")
        end
        it { should be_valid }
      end

      context "created_after when last updated after is present" do
        let(:message) { "can't be used in conjunction with Last Updated After" }

        before do
          list_order.last_updated_after = Time.parse("01/02/2011")
          list_order.created_after = Time.parse("01/01/2011")
        end
        it { should_not be_valid }
        it "has a message" do
          subject.valid?
          subject.errors.messages[:created_after].should include(message)
        end
      end

      context "last updated after when created after is present" do
        let(:message) { "can't be used in conjunction with Created After" }

        before do
          list_order.created_after = Time.parse("01/01/2011")
          list_order.last_updated_after = Time.parse("01/02/2011")
        end
        it { should_not be_valid }
        it "has a message" do
          subject.valid?
          subject.errors.messages[:last_updated_after].should include(message)
        end
      end

    end
  end

  describe "#created_after=" do
    subject { list_order }
    before { list_order.created_after = Time.parse("01/01/2011 00:00:00") }
    its(:created_after) { should == "2011-01-01T05:00:00Z" }
  end

  describe "#path" do
    subject { list_order.path }
    it { should == "orders" }
  end

  describe "#parameters" do
    subject { list_order.parameters }
    before { list_order.created_after = Time.parse("01/01/2011 00:00") }
    it { should == { created_after: "2011-01-01T05:00:00Z", path: "orders", action: "ListOrders" } }
  end
end
