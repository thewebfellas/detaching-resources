# encoding: utf-8

module Oswald
  module Consumer
    def self.included(descendant)
      descendant.extend(ClassMethods)
      Oswald.register_consumer(descendant)
    end

    module ClassMethods
      attr_reader :queue

      def consume(queue)
        @queue = queue
      end
    end
  end
end

