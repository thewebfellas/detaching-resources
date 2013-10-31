# encoding: utf-8

require "spec_helper"

describe Oswald, ".register_consumer" do
  before { Oswald.stub(consumers: []) }

  it "register consumer to Oswald" do
    consumer = Object.new

    Oswald.register_consumer(consumer)

    expect(Oswald.consumers.size).to eq(1)
    expect(Oswald.consumers).to include(consumer)
  end
end

