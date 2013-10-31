# encoding: utf-8

require "spec_helper"
app_require "search_consumer"

describe SearchConsumer, "#perform" do
  let(:consumer) { described_class.new }

  it "updates search results and publishes to queue" do
    payload = %q({"results":null})
    search_results = %q({"results":"OHAI!"})
    broker = double(:broker, publish: nil)
    consumer.stub(broker: broker)

    consumer.perform(payload)

    expect(broker).to have_received(:publish).with(search_results, "dr.searches.results")
  end
end

