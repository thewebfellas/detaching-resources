# encoding: utf-8

require_relative "../models/search_repository"
require "oswald"
require "json"

class SearchResultsConsumer
  include Oswald::Consumer
  consume "dr.searches.results"

  def perform(payload)
    search_attrs = unserialize_message(payload)
    search_repository.update(search_attrs)
  end

  private

  def unserialize_message(payload)
    JSON.parse(payload)
  end

  def search_repository
    SearchRepository
  end
end

