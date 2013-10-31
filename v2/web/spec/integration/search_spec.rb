# encoding: utf-8

require "integration_helper"
require_relative "../../web"

describe "Search" do
  before do
    # I shouldn't mock integration tests, I know. A better solution
    # would be to create controller classes and unit test them. But
    # heck, it's just a proof of concept. Bear with me.
    SearchService.stub(process: true)
  end

  it "creates a new search" do
    post("/searches", q: "foo")

    expect(SearchRepository.count).to eq(1)
  end

  it "redirect to search page" do
    post("/searches", q: "foo")

    expect(last_response).to be_redirect
    expect(last_response.location).to match("/searches/[0-9a-f]*")
  end
end

