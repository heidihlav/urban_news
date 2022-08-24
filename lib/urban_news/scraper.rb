require_relative "../urban_news.rb"

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
   
    
    def self.get_top_stories
      title = doc.css("#block-views-blog-posts-top .item .item-title").map{ |t| t.text }
      title.collect.with_index do |element, index|
        puts "#{index+1} #{element}"
      end

      description = doc.css("#block-views-blog-posts-top .item .item-description").map{ |d| d.text }
      description.collect.with_index do |element, index|
        puts "#{index+1} #{element}"
      end

      # date of issue only #
      metadata = doc.css("#block-views-blog-posts-top .item .item-meta-content .item-date span").map { |m| m.text.strip}
      metadata.each.with_index do |element, index|
        puts ("#{index+1} #{element}")
      end
      
      UrbanNews::Story.new(title, description, metadata)

    end
    def self.get_latest_story
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/urban-edge/"))
      title = doc.css(".featured-item.Urban.Edge .item-title").text
      description = doc.css(".featured-item.Urban.Edge .item-description").text
      metadata = doc.css(".featured-item.Urban.Edge .item-meta-content").text
      "#{title}" "#{description}" "#{metadata}"
    end


    end
end


# UrbanNews::Scraper.all_issues_list_by_index(self)


