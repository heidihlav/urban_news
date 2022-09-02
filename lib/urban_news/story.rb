require_relative "../urban_news.rb"

require 'pry'

module UrbanNews
  class Story

    attr_accessor :title, :description, :metadata, :url, :latest_story, :stories
    @@all = []


    def initialize(attributes=nil)
      if attributes
        attributes.each do |key, value|
        self.send(("#{key}="), value)
        end
      end
    end

    def self.all
      @@all
    end
    binding.pry

    def self.top_stories
      stories = UrbanNews::Scraper.make_top_stories
      @stories = []
      stories.each do |s|
        stories_array = [
        s[:title],
        s[:description],
        s[:metadata], 
        s[:url]] 
        stories_array
      end
      @stories << stories_array
    end
    # binding.pry

    def self.latest_story
      @latest_story = UrbanNews::Scraper.get_latest_story   
    end

  end
end

# UrbanNews::Scraper.get_top_stories
# UrbanNews::Scraper.make_top_stories

# << [@title = story.title, @description = story.description, @metadata = story.metadata, @url = story.url]