# encoding: utf-8

require "spec_helper"

describe Oswald::Broker, "#start"  do
  let(:broker) { build_broker }

  it "starts session and creates channel" do
    session = double(:session).as_null_object
    broker.stub(session: session)

    broker.start

    expect(session).to have_received(:start)
    expect(session).to have_received(:create_channel)
  end
end

