# article belongs to an issue
# class UrbanNews::Article
require_relative "scraper.rb"
require_relative "issues.rb"


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
        save
      end
      # binding.pry

      def self.all
        @@all
      end

      def save
        @@all << self
      end

      def issues_name
        self.issues.name
      end
      

      def issues_name
        self.issues.name if self.issues
      end

      # def self.article_title
      #   @title = UrbanNews::Scraper.get_articles
      # end

      # def self.article_description
      #   @description = UrbanNews::Scraper.get_articles
      # end
           
      # def self.article_meta_data 
      #   @metadata = UrbanNews::Scraper.get_articles
      # end

    end
end

# UrbanNews::Article.new(title, description, metadata)
# UrbanNews::Article.article_title
# UrbanNews::Article.article_description
# UrbanNews::Article.article_meta_data 


