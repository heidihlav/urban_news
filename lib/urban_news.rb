# frozen_string_literal: true

require_relative "../article.rb"
require_relative "../cli.rb"
require_relative "../issues.rb"
require_relative "../scraper.rb"
require_relative "../version.rb"



require 'pry'
require 'nokogiri'
require 'open-uri'

module UrbanNews
  class Error < StandardError; end
  # Your code goes here...
end
