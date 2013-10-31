# encoding: utf-8

require "spec_helper"

describe Oswald::Consumer, ".consume" do
  let(:consumer) {
    Class.new {
      include Oswald::Consumer
      consume "foo"
    }
  }

  it "sets queue name" do
    expect(consumer.queue).to eq("foo")
  end
end

