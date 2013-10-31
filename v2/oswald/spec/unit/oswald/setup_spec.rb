# encoding: utf-8

require "spec_helper"

describe Oswald, ".setup" do
  let(:broker) { double(:broker).as_null_object }

  before { Oswald::Broker.stub(new: broker) }

  it "builds a new broker" do
    url = "amqp://localhost"

    described_class.setup(url)

    expect(Oswald::Broker).to have_received(:new).with(url)
  end
end

