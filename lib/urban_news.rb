# frozen_string_literal: true

require_relative "urban_news/article.rb"
require_relative "urban_news/cli.rb"
require_relative "urban_news/issues.rb"
require_relative "urban_news/scraper.rb"
require_relative "urban_news/version.rb"



require 'pry'
require 'nokogiri'
require 'open-uri'

module UrbanNews
  class Error < StandardError; end
  # Your code goes here...
end
