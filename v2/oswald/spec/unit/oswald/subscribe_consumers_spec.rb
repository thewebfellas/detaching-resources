# encoding: utf-8

require "spec_helper"

describe Oswald, ".subscribe_consumers" do
  let(:broker) { double(:broker).as_null_object }

  it "subscribe consumers to their queues" do
    consumer = double(:consumer, queue: "foo")
    described_class.stub(broker: broker, consumers: [consumer])

    described_class.subscribe_consumers

    expect(broker).to have_received(:subscribe).with(consumer, "foo")
  end
end

