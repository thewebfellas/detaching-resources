# encoding: utf-8

require "spec_helper"

describe Oswald::Consumer, ".included" do
  it "registers consumer" do
    consumer = Class.new
    Oswald.stub(register_consumer: nil)

    consumer.send(:include, described_class)

    expect(Oswald).to have_received(:register_consumer).with(consumer)
  end
end

