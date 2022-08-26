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

    def self.get_page
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/urban-edge/"))
    end
    
    def self.get_top_stories
      get_page.css("#block-views-blog-posts-top .item")
    end

    def self.make_top_stories
      get_top_stories.each do |s|
        title = s.css(".item-title").map{ |t| t.text }
        description = s.css(".item-description").map{ |d| d.text }
        metadata = s.css(".item-meta-content .item-date span").map { |m| m.text.strip}
        url = s.css("a").map { |u| "https://kinder.rice.edu#{u["href"]}" }
      UrbanNews::Story.top_stories(title, description, metadata, url)
# binding.pry
      end
    end


    def self.top_stories_by_index
      make_top_stories.each do |val|
        puts val
      end

    end
    

    #   top_story.collect.with_index do |element, index|
    #     puts "#{index+1} #{element}"
    #   end
    #   @description = descriptions.collect.with_index do |element, index|
    #     puts "#{index+1} #{element}"
    #   end
    #   @metadata = metadatas.each.with_index do |element, index|
    #     puts ("#{index+1} #{element}")
    #   end
    #   @url = urls.map { |u| "https://kinder.rice.edu#{u["href"]}" }

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


