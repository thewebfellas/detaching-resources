# encoding: utf-8

require "spec_helper"

describe Oswald::Broker, "#new"  do
  it "initializes Bunny session" do
    Bunny.stub(new: true)
    url = "amqp://localhost"

    described_class.new(url)

    expect(Bunny).to have_received(:new).with(url)
  end
end

