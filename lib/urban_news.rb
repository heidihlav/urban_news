# frozen_string_literal: true

require_relative "./version"
require_relative "./cli"
require_relative "./article"
require_relative "./issues"
require_relative "./scraper"



require 'pry'
require 'nokogiri'
require 'open-uri'

module UrbanNews
  class Error < StandardError; end
  # Your code goes here...
end
