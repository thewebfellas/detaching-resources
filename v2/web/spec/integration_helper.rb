# encoding: utf-8

require "spec_helper"
require "rack/test"
require "sinatra"

def page
  last_response.body
end

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before do
    fake_db
  end

  def app
    Sinatra::Application
  end
end

