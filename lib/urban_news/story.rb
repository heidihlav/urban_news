require_relative "../urban_news.rb"

require 'pry'

module UrbanNews
  class Story

    attr_accessor :title, :description, :metadata, :url, :latest_story, :stories
    @@all = []


    def self.new_from_blog_page(s)
      self.new(s[:title], s[:description], s[:metadata], s[:url])
    end


    def initialize(title=nil, description=nil, metadata=nil, url=nil)
      @title = title
      @description = description
      @metadata = metadata
      @url = url
      @@all << self
    end

    def self.all
      @@all
    end

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