# article belongs to an issue
# class UrbanNews::Article
require_relative "scraper.rb"

require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
    class Article

      @@all = []

    attr_accessor :title, :description, :metadata, :issues 

      def initialize(title, description, metadata)
        @title = title
        @description = description
        @metadata = metadata
        @@all << self
      end

      def self.all
        @@all
      end

      
      def self.get_articles
        UrbanNews::Issues.all each do |url|
          url = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issue#{url}"))
          title = url.css("h3").text
          description = url.css(".item-description").text
          meta_data = url.css(".item-meta-content").text
          # name = url.css(".view-content .issue")
          UrbanNews::Article.new(title, description, metadata).save
         end
      end

      def issues_name
        self.issues.name if self.issues
      end

      def self.article_title
        @title = UrbanNews::Scraper.article_title
      end

      def self.article_description
        @description = UrbanNews::Scraper.article_description
      end
           
      def self.article_meta_data 
        @metadata = UrbanNews::Scraper.article_meta_data
      end

    end
end

UrbanNews::Article.article_title
UrbanNews::Article.article_description
UrbanNews::Article.article_meta_data 


