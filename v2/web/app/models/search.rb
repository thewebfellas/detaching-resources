# encoding: utf-8

class Search
  attr_reader   :id, :query
  attr_accessor :results

  def initialize(attributes = {})
    @id      = attributes[:id] || SecureRandom.uuid
    @query   = attributes[:query]
    @results = attributes[:results]
  end

  def as_json
    { id: @id, query: @query, results: @results }
  end
end

