# encoding: utf-8

require "spec_helper"
app_require "models/search_repository"

describe SearchRepository, ".save" do
  before do
    stub_const("#{described_class}::DB_PATH", "/tmp")
  end

  it "writes to a file" do
    io = double(:io).as_null_object
    search = double(:search, id: 123)
    described_class.stub(serialize: "foo", io: io)

    described_class.save(search)

    expect(io).to have_received(:write).with("/tmp/123", "foo")
  end
end

