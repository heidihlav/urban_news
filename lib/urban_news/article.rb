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
        UrbanNews::Scraper.article_teaser
        binding.pry
      end

    #   - title and description
           
    #   - metadata
      def article_meta_data 

                
      end




    end
end

UrbanNews::Article.article_title

