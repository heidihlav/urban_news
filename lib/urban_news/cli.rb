require_relative "../urban_news.rb"
# require_relative "issues.rb"
# require_relative "article.rb"
require_relative "scraper.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
  class CLI

    def call
      UrbanNews::Scraper.make_stories
        puts "Welcome to Urban News! Read stories on urban issues affecting Houston and the U.S."
      # puts "About us:" UrbanNews::Scraper.kinder_intro
      start
    end

    # binding.pry
  
    def start
      puts "Would you like to see our top stories? Y/N. Exit by entering 'exit'."
      @input = ""
        input = gets.strip.to_i
        # print_stories(input)
      puts "Which story would you like to read? Enter a number 1 - 5. Exit by entering 'exit'." 
        input = gets.strip
        story = UrbanNews::Story.all


    end






    # def print_stories(input)

    # end

    #   puts "Here is the latest story!"
    #   puts UrbanNews::Scraper.get_latest_story
    #   puts "Would you like to see our top stories? Y/N. Exit by entering 'exit'."
    #   read_top_stories
    #   @input = ""
    #   until @input == "exit"
    #     puts "Which story would you like to read? Enter a number 1 - 5. Exit by entering 'exit'." 
    #     if @input.to_i.between?(1,5) 
    #       UrbanNews::Scraper.get_top_stories
    #     else @input == "exit" 
    #       puts "Thank you for reading!"
        # end
        # puts "Would you like to read about another issue? Y/N. Exit by entering 'exit'."
      # end
    # end
   
    def self.read_top_stories
      UrbanNews::Story.top_stories
    end


      # @input = ""
      # until @input == "exit"
      #   if @input == "Y"
      #   puts "Which story would you like to read? Enter a number 1 - 5. Exit by entering 'exit'." 
      #   elsif @input.to_i.between?(1,5) 
      #     UrbanNews::Story.top_stories_content
      #     puts "Would you like to read about another issue? Y/N. Exit by entering 'exit'."
      #   elsif @input == "N"
      #     puts "Would you like to see our top stories? Y/N. Exit by entering 'exit'."
      #   else @input == "exit" 
      #     puts "Thank you for reading!"
      #   end
      # end
    # end







  end
end

# UrbanNews::Scraper.kinder_intro
# UrbanNews::Issues.new(name, url)
# UrbanNews::Article.new(title, description, metadata)
