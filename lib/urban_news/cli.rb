require_relative "scraper.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'



module UrbanNews
  class CLI

    def call
      puts "Welcome to Urban News! Read the latest stories on urban issues affecting Houston and Texas."
      puts UrbanNews::Scraper.kinder_intro
      @input = ""
      until @input == "exit"
        
        UrbanNnews::Scraper.latest_stories_heading

        show_description_for(chosen_volcano)
         show_quick_facts_for(chosen_volcano)
        see_more_volcanoes
        end
    goodbye 
    end






    def goodbye
        puts "Thank you for reading"
    end


  end
end



