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
        puts "#{i} #{char}" unless i == 0
      end
    end

    def self.latest_stories_heading
        doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issue/covid-19-and-cities"))
        puts heading = doc.css(".block__title").first.text
    end

    def self.article_teaser
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issue/covid-19-and-cities"))
      puts doc.css(".item-content")[0..3].text
    end

    def self.article_meta_data
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issue/covid-19-and-cities"))
      puts doc.css(".item-meta-content").text
    end


    



    end
end

UrbanNews::Scraper.kinder_intro
UrbanNews::Scraper.all_issues_list_by_index
UrbanNews::Scraper.latest_stories_heading
UrbanNews::Scraper.article_teaser
UrbanNews::Scraper.article_meta_data


