# encoding: utf-8

require "spec_helper"
app_require "models/search"

describe Search, ".new" do
  context "when id not defined" do
    it "generates a random one" do
      search = described_class.new

      expect(search.id).to be
    end
  end
end

