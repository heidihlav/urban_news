# article belongs to issue
# class UrbanNews::Article
require_relative "scraper.rb"

require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
    class Article

    attr_accessor :title, :description, :metadata 

      def initialize(title, description, metadata)
        @title = title
        @description = description
        @metadata = metadata
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


