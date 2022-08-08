# frozen_string_literal: true

require_relative "urban_news/version"
require_relative "urban_news/cli"
require_relative "urban_news/month"
require_relative "urban_news/event"
require_relative "urban_news/scraper"

require 'pry'
require 'nokogiri'
require 'open-uri'

module UrbanNews
  class Error < StandardError; end
  # Your code goes here...
end
