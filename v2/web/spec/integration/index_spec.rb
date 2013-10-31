# encoding: utf-8

require "integration_helper"
require_relative "../../web"

describe "Index page" do
  it "shows the search form" do
    get("/")

    expect(page).to match("Search:")
  end
end

