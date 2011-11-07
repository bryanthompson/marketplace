require 'helper'

describe Marketplace::Resource do
  describe ".build" do
    let(:resource) { mock }
    before do
      Marketplace::Resource.stub(:new).and_return(resource)
      Marketplace::Resource.should_receive(:new)
      resource.should_receive(:build)
    end
    it { subject.build({}) }
  end

  describe "#endpoint" do
    let(:resource) { Marketplace::Resource.new(parameters) }

    subject { resource.endpoint }

    context "an endpoint with a trailing slash" do
      let(:parameters) { { endpoint: "example.com/" } }
      it { should == "example.com/" }
    end

    context "an endpoint with no trailing slash" do
      let(:parameters) { { endpoint: "example.com" } }
      it { should == "example.com/" }
    end
  end

  describe "#parameters=" do
    let(:resource) { Marketplace::Resource.new(parameters) }
    let(:parameters) { { endpoint: "foo", path: "bar" } }

    subject { resource.parameters }
    it "removes extraneous parameters" do
      subject.should_not include(:endpoint, :path)
    end
  end

  describe "#path=" do
    let(:resource) { Marketplace::Resource.new(parameters) }
    let(:parameters) { { path: "bar" } }
    subject { resource.path }

    it "titleizes the path" do
      subject.should == "Bar"
    end
  end

  describe "#url" do
    let(:resource) { Marketplace::Resource.new(parameters) }
    subject { resource.url }

    context "with an endpoint and a path" do
      let(:parameters) { { endpoint: "foo", path: "bar" } }
      it { should == "foo/Bar" }
    end

    context "with an endpoint and no path" do
      let(:parameters) { { endpoint: "foo"} }
      it { should == "foo/" }
    end

    context "with no endpoint and a path" do
      let(:parameters) { { path: "foo"} }
      it { should == "Foo" }
    end
  end
end
