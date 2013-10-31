# encoding: utf-8

require "oswald"
require_relative "../search_consumer"

cli = Oswald::CLI.new("amqp://guest:guest@localhost:5672")

cli.run

