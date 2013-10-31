# encoding: utf-8

require "spec_helper"
app_require "search_consumer"

describe SearchConsumer do
  it "consumes dr.searches queue" do
    expect(described_class.queue).to eq("dr.searches")
  end
end

