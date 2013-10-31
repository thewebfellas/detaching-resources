# encoding: utf-8

require "oswald"

class PutsConsumer
  include Oswald::Consumer
  consume "dr.searches"

  def perform(payload)
    puts payload
  end
end

