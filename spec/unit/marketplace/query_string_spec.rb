require 'helper'

describe Marketplace::QueryString do
  describe ".build" do
    let(:query_string) { mock("Marketplace::QueryString") }

    subject { Marketplace::QueryString }

    context "with no arguments" do
      let(:parts) { nil }
      let(:message) { "There were no parameters from which to build a query string" }

      it "raises an error" do
        expect do
          subject.build(parts)
        end.to raise_error(Marketplace::Exceptions::QueryStringArgumentError, message)
      end
    end

    context "given a hash" do
      let(:parts) { { a: 1 } }

      before do
        Marketplace::QueryString.stub(:new).with(parts).and_return(query_string)
        Marketplace::QueryString.should_receive(:new).and_return(query_string)
        query_string.should_receive(:construct!)
      end

      it { subject.build(parts) }
    end
  end

  describe "#construct!" do
    let(:query_string) { Marketplace::QueryString.new({a: 1}) }
    subject { query_string.construct! }
    it "escapes the parameters" do
      pending
    end
  end

  describe "#parameters" do
    subject { Marketplace::QueryString.new(parts).parameters }

    context "with 1 parameter" do
      let(:parts) { { a: 1 } }
      it { should == "?A=1" }
    end

    context "with 2 parameters" do
      let(:parts) { { a: 1, b: 2 } }
      it { should == "?A=1&B=2" }
    end
  end
end
