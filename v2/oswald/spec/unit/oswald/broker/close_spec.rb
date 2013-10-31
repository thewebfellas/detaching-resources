# encoding: utf-8

require "spec_helper"

describe Oswald::Broker, "#close"  do
  let(:broker) { build_broker }

  it "closes the session" do
    session = double(:session).as_null_object
    broker.stub(session: session)

    broker.close

    expect(session).to have_received(:close)
  end
end

