# encoding: utf-8

require "spec_helper"
app_require "models/search_repository"

DummyFile = Struct.new(:id)

describe SearchRepository, ".find" do
  let(:file) { DummyFile.new(123) }
  let(:io)   { double(:io) }

  before do
    described_class.stub(io: io)
  end

  context "when record exists" do
    let(:serialized_file) { Marshal.dump(file) }

    it "returns it" do
      io.stub(exists?: true, read: serialized_file)

      search = described_class.find(file.id)

      expect(search.id).to eq(file.id)
    end
  end

  context "when record not found" do
    it "returns nil" do
      io.stub(exists?: false)

      expect(described_class.find(123)).to be_nil
    end
  end
end

