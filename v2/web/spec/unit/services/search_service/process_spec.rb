# encoding: utf-8

require "spec_helper"
app_require "services/search_service"

describe SearchService, "#process" do
  it "publishes to dr.searches queue" do
    broker = double(:broker, publish: nil)
    described_class.stub(broker: broker)
    search = double(:search, as_json: {})

    described_class.process(search)

    expect(broker).to have_received(:publish).with("{}", "dr.searches")
  end
end

