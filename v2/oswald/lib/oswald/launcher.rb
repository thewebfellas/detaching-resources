# encoding: utf-8

require_relative "broker"

module Oswald
  class Launcher
    def initialize(url)
      @url = url
    end

    def start
      Oswald.setup(@url)
      Oswald.broker.start
      Oswald.subscribe_consumers
    end

    def stop
      Oswald.broker.close
    end
  end
end

