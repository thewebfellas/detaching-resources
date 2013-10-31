# encoding: utf-8

require_relative "search"

module SearchRepository
  extend self

  def save(search)
    io.write(file(search.id), serialize(search))
  end

  def find(id)
    return nil unless io.exists?(file(id))

    unserialize(io.read(file(id)))
  end

  def create(query)
    search = new(query)
    save(search)

    search
  end

  def update(attributes)
    search = find(attributes["id"])
    search.results = attributes["results"]
    save(search)

    search
  end

  def count
    Dir.glob("#{DB_PATH}/*").count
  end

  private

  DB_PATH = File.join(File.dirname(__FILE__), "../../tmp/db")

  def file(id)
    DB_PATH + "/#{id}"
  end

  def serialize(object)
    Marshal.dump(object)
  end

  def unserialize(data)
    Marshal.load(data)
  end

  def io
    File
  end
end

