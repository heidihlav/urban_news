require_relative "../urban_news.rb"

require 'pry'

module UrbanNews
  class Story

    attr_accessor :title, :description, :metadata, :url, :content
    @@all = []

    def self.new_from_blog_page(s)
      self.new(s[:title], s[:description], s[:metadata], s[:url], s[:content])
    end

    def initialize(title, description, metadata, url, content)
      @title = title
      @description = description
      @metadata = metadata
      @url = url
      @content = content
      @@all << self
    end

    def self.all
      @@all
    end
    binding.pry

    def self.find(id)
      self.all[id-1]
    end

    def self.top_stories
      # top_stories_by_index = []
      self.all.each do |story|
       puts "#{story.title}"
       puts "#{story.description}"
       puts "#{story.metadata}"
       puts "#{story.url}"
       puts "#{story.content}"
      end
    end

    # def self.top_stories_content
    #   self.top_stories.with_index do |story, index|
    #     puts "#{index+1}." 
    #     puts "#{story.url}"
    #     puts "#{story.content}"
    #    end
    # end

    def self.latest_story
      @latest_story = UrbanNews::Scraper.get_latest_story   
    end

  end
end

