# encoding: utf-8

require "spec_helper"

describe Oswald::Broker, "#publish"  do
  let(:broker) { build_broker }

  it "published message on queue" do
    queue = double(:queue).as_null_object
    broker.stub(queues: { "bar" => queue })

    broker.subscribe(double(:consumer), "bar")

    expect(queue).to have_received(:subscribe)
  end
end

