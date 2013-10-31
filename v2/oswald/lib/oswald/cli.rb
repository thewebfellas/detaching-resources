# encoding: utf-8

require_relative "launcher"

module Oswald
  class CLI
    def initialize(url)
      @launcher = Oswald::Launcher.new(url)
      @signal_queue = []
    end

    def run
      daemonize
      register_signal_handlers

      launcher.start

      start_loop
    end

    def start_loop
      catch(:terminate) do
        loop do
          handle_signal
        end
      end
    end

    def register_signal_handlers
      %w(TERM).each do |sig|
        trap sig do
          signal_queue << sig
        end
      end
    end

    def handle_signal
      case signal_queue.pop
      when "TERM"
        launcher.stop
        throw(:terminate)
      end
    end

    def daemonize
      Process.daemon(true, true)
    end

    private

    attr_reader :launcher, :signal_queue
  end
end

