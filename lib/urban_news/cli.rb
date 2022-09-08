# require_relative "issues.rb"
# require_relative "article.rb"
# require_relative "scraper.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
  class CLI

    def call
      puts "Welcome to Urban News! Read stories on urban issues affecting Houston and the U.S."
      puts "About us:"
      UrbanNews::Scraper.kinder_intro
      puts "Here is the latest story!"
      puts UrbanNews::Scraper.get_latest_story
      puts "Would you like to see our top stories? Y/N. Exit by entering 'exit'."
     
    #  binding.pry
      @input = ""
      until @input == "exit"
        puts "Which story would you like to read? Enter a number 1 - 5. Exit by entering 'exit'." 
        if @input.to_i.between?(1,5) 
          UrbanNews::Scraper.get_top_stories
        else @input == "exit" 
          puts "Thank you for reading!"
        end
        puts "Would you like to read about another issue? Y/N. Exit by entering 'exit'."
      end
    end
   

  end
end

# UrbanNews::Scraper.kinder_intro
# UrbanNews::Issues.new(name, url)
# UrbanNews::Article.new(title, description, metadata)
