require_relative "scraper.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'



module UrbanNews
  class CLI

    # def call
    #   puts "Welcome to Urban News! Read the latest stories on urban issues affecting Houston and Texas."
    #   puts UrbanNews::Scraper.kinder_intro
    #   @input = ""
    #   until @input == "exit"
    #     puts "Which issue would you like to read about? Enter a number 1 - 14. Exit by entering 'exit'." 
    #     UrbanNews::Scraper.all_issues_list_by_index(issues)
    #     UrbanNews::Scraper.latest_stories_heading
    #     UrbanNews::Scraper.article_title
    #     UrbanNews::Scraper.article_description
    #     UrbanNews::Scraper.article_meta_data
    #     puts "Would you like to read about another issue? Y/N. Exit by entering 'exit'."
    #   end
    #   goodbye
    # end

    # call
    
    # def goodbye
    #     puts "Thank you for reading!"
    # end


  end
end

