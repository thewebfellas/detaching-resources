# encoding: utf-8

require "oswald"
require "json"

class SearchConsumer
  include Oswald::Consumer
  consume "dr.searches"

  def perform(payload)
    search = unserialize(payload)
    search["results"] = "OHAI!"

    broker.publish(serialize(search), "dr.searches.results")
  end

  private

  def broker
    Oswald.broker
  end

  def unserialize(data)
    JSON.parse(data)
  end

  def serialize(object)
    JSON.dump(object)
  end
end

