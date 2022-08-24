# require_relative "issues.rb"
# require_relative "article.rb"
# require_relative "scraper.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'



module UrbanNews
  class CLI

    def call
      puts "Welcome to Urban News! Read stories on urban issues affecting Houston and Texas."
      puts "About us:" 
      UrbanNews::Scraper.kinder_intro
      puts "Here is the latest story!"
      UrbanNews::Scraper.get_latest_story
      puts "Would you like to see our top stories? Y/N. Exit by entering 'exit'."
        @input = ""
      until @input == "exit"
        puts "Which story would you like to read? Enter a number 1 - 5. Exit by entering 'exit'." 
        if @input.between?(1,5) 
          UrbanNews::Scraper.get_top_stories
        else @input == "exit" 
          goodbye
        end
        puts "Would you like to read about another issue? Y/N. Exit by entering 'exit'."
      end
      goodbye

    end
   
    def 
    def goodbye
        puts "Thank you for reading!"
    end


  end
end

# UrbanNews::Scraper.kinder_intro
# UrbanNews::Issues.new(name, url)
# UrbanNews::Article.new(title, description, metadata)
