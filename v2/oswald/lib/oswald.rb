# encoding: utf-8

require "oswald/version"
require "oswald/broker"
require "oswald/consumer"
require "oswald/cli"
require "oswald/launcher"

module Oswald
  extend self

  attr_reader :broker

  def setup(url)
    @broker = Broker.new(url)
  end

  def consumers
    @consumers ||= []
  end

  def register_consumer(consumer)
    consumers << consumer
  end

  def subscribe_consumers
    consumers.each do |consumer|
      broker.subscribe(consumer, consumer.queue)
    end
  end
end

