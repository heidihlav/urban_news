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
      story = UrbanNews::Story.find(input.to_i)

      # binding.pry
      print_url_content_credit(story) # print_credit_url_
      puts "Would you like to read another story? Y/N."
      input = gets.strip
          if input.downcase == "y"
            start
          elsif input.downcase == "n"
            puts "Thank you for reading!"
            exit
          else
            puts " "
            puts "***Try again.***"
            start
        end 
      end
      # story = UrbanNews::Story.find(input.to_i)
      # 4 and 14 15 need work on scraper
      # print_url_content_credit(story) # print_credit_url_content for chosen story aka input
      # puts "Would you like to read another story? Y/N."
      # input = gets.strip
      #   if input.downcase == "y"
      #     start
      #   elsif input.downcase == "n"
      #     puts "Thank you for reading!"
      #     exit
      #   else input.downcase == "exit"
      #     puts "Thank you for reading!"
      #     exit
        # else 
        #   puts "Try again."
        #   start
        # end

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
          # if user_input == nil
          #   puts " "
          #   puts "***Try again.***"
          #   start
          # else 
            puts " "
          puts "Source: #{user_input.url}"
          puts " "
          puts "#{user_input.title}"
          puts " "
          puts "#{user_input.credit}"
          puts " "
          puts "#{user_input.content}" 
          # end
          # UrbanNews::Story.all[user_input-1].each.with_index(user_input) do |story, index|
        end
        
        # UrbanNews::Story.all[input-1].each.with_index(input) do |story, index|
        #   puts "#{index}. #{story.title}"
        #   puts " "
        #   puts "#{story.summary}"
        # end
      # input = gets.strip
      # puts "Which story would you like to read? Enter the number of the story."
      # chosen_one = UrbanNews::Story.find(input.to_i) ##input is number picked by user
      # print_chosen_story(chosen_one)
      # read_another_story(user_input)
      # start       


    # def start
    #   user_input = gets.strip
    #   print_teasers(user_input) ## input will be Y/N/exit #Y triggers print_teasers # N will exit
    #   input = gets.strip
    #   chosen_one = UrbanNews::Story.find(input.to_i) ##input is number picked by user
    #   print_chosen_story(chosen_one)
    #   read_another_story(user_input)


      # input = gets.strip.downcase
      # if input == "y"
      #   start
      # elsif input == "n"
      #   puts "Thank you for reading!"
      #   exit
      # else
      #   puts "Try again."
      #   start
      # end
    # end

   ## user_input will be Y/N/exit #Y triggers print_teasers # N will exit
    # def print_latest_posts
    #   UrbanNews::Story.all.collect.with_index do |s, index|  
    #       puts "#{index+1}." " " "#{s.title}"
    #       puts "#{s.description}"
    #       puts "#{s.metadata}"
    #       puts "-------------"
    #     end
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
    

    # def read_another_story(input)
    #   # print_teasers(user_input) ## input will be Y/N/exit #Y triggers print_teasers # N will exit
    # end
   
   
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