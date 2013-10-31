# encoding: utf-8

require "bunny"

module Oswald
  class Broker
    def initialize(url)
      @session = Bunny.new(url)
      @queues  = {}
    end

    def start
      session.start
      @channel = session.create_channel
    end

    def publish(msg, queue_name)
      queue(queue_name).publish(msg)
    end

    def subscribe(consumer, queue_name)
      queue(queue_name).subscribe do |delivery_info, properties, payload|
        consumer.new.perform(payload)
      end
    end

    def close
      session.close
    end

    private

    attr_reader :session, :channel, :queues

    def queue(name)
      queues[name] ||= channel.queue(name)
    end
  end
end

