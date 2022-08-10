#issues has many articles
# class UrbanNews::Issues

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

    def print_all_issues(self)
      UrbanNews::Scraper.all_issues_list_by_index

    end
  



    end
end

UrbanNews::Issues.print_all_issues_list_by_index
