# encoding: utf-8

require "integration_helper"
require_relative "../../web"

describe "Search results" do
  context "when results still being processed" do
    let(:search) { create_search }

    it "shows a placeholder as the result" do
      get("/searches/#{search.id}")

      expect(page).to match("Searching...")
    end
  end

  context "when search finished" do
    let(:search) { create_search(results: "OMG!") }

    it "shows the actual results" do
      get("/searches/#{search.id}")

      expect(page).to match("OMG!")
      expect(page).to_not match("Searching...")
    end
  end

  private

  def create_search(attrs = {})
    search = Search.new(attrs)
    SearchRepository.save(search)

    search
  end
end

