require_relative "../urban_news.rb"

require 'pry'

module UrbanNews
  class Story

    @@all = []

    attr_accessor :title, :description, :metadata, :latest_story

    def initialize(title, description, metadata, url)
      @title = title
      @description = description
      @metadata = metadata
      @url = url
      @@all << self 
    end
    # binding.pry

    def self.all
      @@all
    end

    def self.latest_story
      @latest_story = UrbanNews::Scraper.get_latest_story   
    end



  end
end