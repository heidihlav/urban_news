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
   

    def self.get_latest_story
      # UrbanNews::Issues.all.each do |issue_url|
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/"))
      title = doc.css(".featured-item.Urban.Edge .item-title").text
      description = doc.css(".featured-item.Urban.Edge .item-description").text
      # UrbanNews::Issues.new(name, url).save
    end
    
    def self.get_top_stories
      # UrbanNews::Issues.all.each do |issue_url|
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/"))
      title = doc.css("#block-views-blog-posts-top .item .item-title").text
      description = doc.css("#block-views-blog-posts-top .item .item-description").text
      metadata = doc.css("#block-views-blog-posts-top .item .item-meta-content").text
      # UrbanNews::Article.new(title, description, meta_data).save
    end


    end
end


# UrbanNews::Scraper.all_issues_list_by_index(self)


