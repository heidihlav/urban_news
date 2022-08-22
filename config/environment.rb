require 'bundler/setup'
Bundler.require(:default, :development)

module UrbanNews

end

require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative "../lib/urban_news/cli"
require_relative "../lib/urban_news/scraper"
require_relative "../lib/urban_news/story"
require_relative "../lib/urban_news/version"



