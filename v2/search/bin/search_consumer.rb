# encoding: utf-8

require "oswald"
require_relative "../search_consumer"

cli = Oswald::CLI.new("amqp://guest:guest@#{ENV["QUEUE_HOST"]}:5672")

cli.run

