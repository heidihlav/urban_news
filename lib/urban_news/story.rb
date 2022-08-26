require_relative "../urban_news.rb"

require 'pry'

module UrbanNews
  class Story

    attr_accessor :title, :description, :metadata, :url, :latest_story
    @@all = []


    def self.top_stories(title, description, metadata, url)
      story = self.new(title, description, metadata, url)      
      @@all << [@title = story.title, @description = story.description, @metadata = story.metadata, @url = story.url]
    end


    def initialize(title, description, metadata, url)
      @title = title
      @description = description
      @metadata = metadata
      @url = url
      @@all << self 
    end


    def self.all
      @@all
    end


    def self.latest_story
      @latest_story = UrbanNews::Scraper.get_latest_story   
    end

  end
end

# UrbanNews::Scraper.get_top_stories
# UrbanNews::Scraper.make_top_stories

