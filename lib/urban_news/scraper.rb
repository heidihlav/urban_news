require_relative "../urban_news.rb"

require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
  class Scraper

    def self.kinder_intro #gsub extra spaces btwn paragraphs?
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issues"))
      intro = doc.css("div .main div .content").text.split("   ")
      puts "#{intro[3]}""#{intro[4]}"
    end
   
    
    def self.get_top_stories_titles
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/urban-edge/"))
      title = doc.css("#block-views-blog-posts-top .item .item-title").map{ |t| t.text }
    end

    def self.get_top_stories_descriptions
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/urban-edge/"))
      description = doc.css("#block-views-blog-posts-top .item .item-description").map{ |d| d.text }
    end
    
    def self.get_top_stories_metadata
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/urban-edge/"))
      metadata = doc.css("#block-views-blog-posts-top .item .item-meta-content .item-date span").map { |m| m.text.strip}
    end

    def self.get_top_stories_urls
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/urban-edge/"))
      url = doc.css("#block-views-blog-posts-top .item a")
    end



    def self.make_top_stories
      self.get_top_stories.each do |top_story|

      top_story.collect.with_index do |element, index|
        puts "#{index+1} #{element}"
        binding.pry
      end
      @description = descriptions.collect.with_index do |element, index|
        puts "#{index+1} #{element}"
      end
      @metadata = metadatas.each.with_index do |element, index|
        puts ("#{index+1} #{element}")
      end
      @url = urls.map { |u| "https://kinder.rice.edu#{u["href"]}" }
      UrbanNews::Story.new(title, description, metadata, url)
    end
    end

    # binding.pry

    def self.get_latest_story
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/urban-edge/"))
      title = doc.css(".featured-item.Urban.Edge .item-title").text
      description = doc.css(".featured-item.Urban.Edge .item-description").text
      metadata = doc.css(".featured-item.Urban.Edge .item-meta-content").text
      "#{title}" "\n\n#{description}" "#{metadata}"
    end


  end
end


# UrbanNews::Scraper.all_issues_list_by_index(self)


