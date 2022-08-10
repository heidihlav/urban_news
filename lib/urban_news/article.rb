# article belongs to issue
# class UrbanNews::Article
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

    #   - title and description
           
    #   - metadata
      def article_meta_data 

                
      end




    end
end