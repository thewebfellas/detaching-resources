# encoding: utf-8

require "sinatra"
require_relative "app/models/search"
require_relative "app/models/search_repository"
require_relative "app/services/search_service"

set :views, "app/views"

get "/" do
  erb :index
end

post "/searches" do
  search = Search.new(query: params[:q])
  SearchRepository.save(search)
  SearchService.process(search)

  redirect to("/searches/#{search.id}")
end

get "/searches/:id" do
  @search = SearchRepository.find(params[:id])

  erb :search
end

