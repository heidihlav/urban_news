require_relative "../urban_news.rb"

require 'pry'

module UrbanNews
  class Story

    @@all = []

    attr_accessor :title, :description, :metadata, :latest_story

    def initialize(title, description, metadata)
      @title = title
      @description = description
      @metadata = metadata
      @latest_story = latest_story
      @@all << self 
    end

    def self.all
      @@all
    end



  end
end