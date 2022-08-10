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
        UrbanNews::Scraper.article_title

        binding.pry
      end

      def self.article_description
        UrbanNews::Scraper.description

        # binding.pry
      end
           
    #   - metadata
      def self.article_meta_data 
        UrbanNews::Scraper.article_meta_data

                
      end




    end
end

UrbanNews::Article.article_title

