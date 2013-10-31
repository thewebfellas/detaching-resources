# encoding: utf-8

require "rspec"

SPEC_ROOT = File.dirname(__FILE__)
SPEC_TMP  = "#{SPEC_ROOT}/tmp"

def app_require(file)
  require_relative "../app/#{file}"
end

def clear_database
  FileUtils.rm_rf(Dir.glob("#{SPEC_TMP}/*"))
end

def fake_db
  stub_const("SearchRepository::DB_PATH", SPEC_TMP)
end

RSpec.configure do |config|
  config.after do
    clear_database
  end
end

