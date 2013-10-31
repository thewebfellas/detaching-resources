# encoding: utf-8

require "spec_helper"
require "tempfile"
app_require "models/search_repository"

describe SearchRepository, ".count" do
  before do
    fake_db
  end

  context "when repository empty" do
    it "returns zero" do
      expect(described_class.count).to eq(0)
    end
  end

  context "when repository has one record" do
    before do
      Tempfile.new("foo", SPEC_TMP)
    end

    it "returns one" do
      expect(described_class.count).to eq(1)
    end
  end
end

