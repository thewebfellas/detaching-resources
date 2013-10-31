# encoding: utf-8

require "oswald"

def build_broker
  # Avoid Bunny to try to connect to RabbitMQ on Session initialization
  Bunny::Session.any_instance.stub(initialize_transport: true)

  Oswald::Broker.new("amqp://localhost")
end

