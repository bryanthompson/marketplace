require 'helper'

describe Marketplace::Connection do
  describe ".connect" do
    let(:connection) { mock("Marketplace::Connection") }

    subject { Marketplace::Connection }

    before do
      Marketplace::Connection.stub(:new).and_return(connection)
      Marketplace::Connection.should_receive(:new).and_return(connection)
    end

    it { subject.connect }
  end
end
