# encoding: utf-8

require "spec_helper"
app_require "consumers/search_results_consumer"

describe SearchResultsConsumer, ".queue" do
  it "consumes dr.searches.results" do
    expect(described_class.queue).to eq("dr.searches.results")
  end
end

