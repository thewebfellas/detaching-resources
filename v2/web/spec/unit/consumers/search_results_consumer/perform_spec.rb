# encoding: utf-8

require "spec_helper"
app_require "consumers/search_results_consumer"

describe SearchResultsConsumer, "#perform" do
  let(:consumer) { described_class.new }

  it "updates search in repository" do
    repo = double(:search_repository, update: true)
    consumer.stub(search_repository: repo)

    consumer.perform(%q({ "id": 123 }))

    expect(repo).to have_received(:update).with({ "id" => 123 })
  end
end

