require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
    class Scraper

    def self.kinder_intro
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issues"))
      intro = doc.css("div .main div .content").text.split("    ")
      puts "#{intro[3]}" 
      puts "#{intro[4]}"
    end

    def self.all_issues_list_by_index
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issues"))
      issues = doc.css(".view-content .issue").text.split("  
        ")
      numbered_issues = issues.collect.with_index(0) do |char, i| 
        puts "#{i} #{char}" 
      end
    end






    end
end

UrbanNews::Scraper.kinder_intro
UrbanNews::Scraper.all_issues_list_by_index
