require 'bundler/setup'
Bundler.require(:default, :development)

require_relative "../lib/urban_news/article"
require_relative "../lib/urban_news/cli"
require_relative "../lib/urban_news/issues"
require_relative "../lib/urban_news/scraper"
require_relative "../lib/urban_news/version"



require 'pry'
require 'nokogiri'
require 'open-uri'