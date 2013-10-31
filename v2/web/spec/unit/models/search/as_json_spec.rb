# encoding: utf-8

describe Search, "#as_json" do
  it "returns hash of attributes" do
    attrs  =  { id: 123, query: "foo", results: "bar" }
    search = described_class.new(attrs)

    expect(search.as_json).to eq(attrs)
  end
end

