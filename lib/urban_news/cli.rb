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
      UrbanNews::Scraper.make_articles
      puts " "
      puts "*** Welcome to Urban News! Read stories on urban issues affecting Houston and the U.S. ***"
      puts " "
      start
    end
      
    def start
      puts " "
      puts "-------------Here are our Latest Posts:-------------"
      puts " "
      print_title_and_summary  # print_title_and_summary_with_index of each story
      puts " "
      puts "Which story would you like to read? Enter the number of the story."
      input = gets.strip
      case input
      when "1".."15"
        story = UrbanNews::Story.find(input.to_i)
        print_url_content_credit(story)
      # when input.count("a-zA-Z") > 0
      #   puts " "
      #   puts "***Try again.***"
      #   start
      else 
        puts " "
        puts "***Try again!***"
        start
      end  
      puts " "
      puts "Would you like to read another story? Y/N."
      puts " "
      input = gets.strip
          if input.downcase == "y"
            start
          elsif input.downcase == "n"
            puts "Thank you for reading!"
            exit
          else
            puts " "
            puts "***Try again!***"
            start
        end 
    end
      # 4 and 14 15 need work on scraper

        def print_title_and_summary
          UrbanNews::Story.all.each.with_index do |story, index|
            puts " "
            puts "Story# #{index+1}. #{story.title}"
            puts " "
            puts "#{story.summary}"
            puts " "
            puts "----------------------------------------------------"
          end
        end

        def print_url_content_credit(user_input)
          puts " "
          puts "Source: #{user_input.url}"
          puts " "
          puts "#{user_input.title}"
          puts " "
          puts "#{user_input.credit}"
          puts " "
          puts "#{user_input.content}"
          puts " " 
        end
        
        # UrbanNews::Story.all[input-1].each.with_index(input) do |story, index|
        #   puts "#{index}. #{story.title}"
        #   puts " "
        #   puts "#{story.summary}"
        # end


    # def print_chosen_story(user_input)
    #   UrbanNews::Story.top_stories.map.with_index do |s, index|
    #       if user_input.to_i == index
    #         puts "#{index+1}." "#{s.url}"
    #         puts "-------------"
    #         puts "#{s.content}"
    #         puts "-------------"
    #       end
    #   end
    # end
   
   
    def self.read_top_stories
      UrbanNews::Story.top_stories
    end 

  end
end

