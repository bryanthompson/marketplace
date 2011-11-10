require 'helper'

describe Marketplace::QueryString do
  let(:path) { "/foo" }

  describe ".new" do
    let(:query_string) { mock("Marketplace::QueryString") }

    subject { Marketplace::QueryString }

    context "with no arguments" do
      let(:parameters) { {} }
      let(:message) { "There were no parameters from which to build a query string" }

      it "raises an error" do
        expect do
          subject.new(path, parameters)
        end.to raise_error(Marketplace::Exceptions::QueryStringArgumentError, message)
      end
    end
  end

  describe "#to_canonical" do
    let(:params) { { A: 1 } }
    let(:query_string) { Marketplace::QueryString.new(path, params) }
    subject { query_string.to_canonical }
    before { query_string.stub(:parameters).and_return(params) }

    it "escapes the parameters" do
      subject.should == "%3FA%3D1"
    end
  end

  describe "#parameters" do
    let(:query_string) { Marketplace::QueryString.new(path, {foo: "bar"}) }
    subject { query_string.parameters }

    it "titleizes all keys in the hash" do
      subject.should have_key("Foo")
    end
  end

  describe "#parameters" do
    subject { Marketplace::QueryString.new(path, parameters) }
    before { subject.stub(:parameters).and_return(parameters) }

    context "with 1 parameter" do
      let(:parameters) { { A: 1 } }
      its(:parameters) { should == "?A=1" }
    end

    context "with 2 parameters" do
      let(:parameters) { { "A" => 1, "B" => 2 } }
      its(:parameters) { should == "?A=1&B=2" }
    end
  end
end
