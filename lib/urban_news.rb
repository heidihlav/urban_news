# frozen_string_literal: true

require_relative "urban_news/version"
require_relative "urban_news/cli"
require_relative "urban_news/article"
require_relative "urban_news/issues"
require_relative "urban_news/scraper"



require 'pry'
require 'nokogiri'
require 'open-uri'

module UrbanNews
  class Error < StandardError; end
  # Your code goes here...
end
