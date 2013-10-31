# encoding: utf-8

require "oswald"
require "json"

module SearchService
  extend self

  def process(search)
    broker.publish(serialize(search), "dr.searches")
  end

  private

  def serialize(search)
    JSON.dump(search.as_json)
  end

  def broker
    Oswald.broker || setup_broker
  end

  def setup_broker
    Oswald.setup("amqp://guest:guest@10.11.12.1:5672")
    Oswald.broker.start

    Oswald.broker
  end
end

