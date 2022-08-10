#issues has many articles
# class UrbanNews::Issues
require_relative "scraper.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
    class Issues

    attr_accessor :name, :intro 

    def initialize(name, intro)
      @name = name
      @intro = intro
    end

    def self.print_all_issues
      UrbanNews::Scraper.all_issues_list_by_index(self)
    end
  


    # UrbanNews::Issues.print_all_issues

    end
end

UrbanNews::Issues.print_all_issues
