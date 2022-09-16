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
      UrbanNews::Scraper.new.make_stories
      puts "Welcome to Urban News! Read stories on urban issues affecting Houston and the U.S."
      " "
      start        
    end

    def start
      puts "Would you like to see our top stories? Y/N."
      user_input = gets.strip
      print_teasers(user_input) ## input will be Y/N/exit #Y triggers print_teasers # N will exit
      puts "Which story would you like to read? Enter the number of the story."
      input = gets.strip
      story = UrbanNews::Story.find(input.to_i) ##input is number picked by user
      print_chosen_story(chosen_one)
      puts "Would you like to read another story? Y/N." ## input will be Y/N/exit #Y triggers print_stories # N will exit
      
      input = gets.strip.downcase
      if input == "y"
        start
      elsif input == "n"
        puts "Thank you for reading!"
        exit
      else
        puts "Try again."
        start
      end
    end


    def print_teasers(user_input) ##this only needs to be print title/description/date
      UrbanNews::Story.top_stories.map.with_index do |s, index|
        if user_input == index+1
        puts "#{index+1}." "#{s.title}"
        puts "#{s.description}"
        " "
        puts "#{s.metadata}"
        "-------------"
        # binding.pry
    end
    
    def print_chosen_story(chosen_one)
      UrbanNews::Story.all.map.with_index(chosen_one) do |s, index|
        puts "#{index+1}." "#{s.url}"
        " "
        puts "#{s.content}"
        "-------------"
      end
    end
   
   
    def self.read_top_stories
      UrbanNews::Story.top_stories
    end


     

  end
end

# UrbanNews::Scraper.kinder_intro
# UrbanNews::Issues.new(name, url)
# UrbanNews::Article.new(title, description, metadata)

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