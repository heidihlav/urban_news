#issues has many articles
# class UrbanNews::Issues
require_relative "scraper.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
    class Issues

    attr_accessor :name, :url 

    def initialize(name, url)
      @name = name
      @url = url
    end

    def self.print_all_issues
      @name = UrbanNews::Scraper.all_issues_list_by_index(self)
        @name.collect.with_index(0) do |char, i| 
          puts "#{i} #{char}" unless i == 0
        end 
    end

    def self.all_issue_pages
      @url = UrbanNews::Scraper.issue_page_url
      @url.collect.with_index(1) do |char, i|
        puts "#{i} #{char}" unless i == 0
      end
    end 

    def self.user_select_an_issue
      def self.print_all_issues
        def self.all_issue_pages



    end


    # def self.user_choose_issue
    #     puts "Which issue do you want to read about?"
    #     number_chosen = gets.strip.to_i
        # if number_chosen ==  


    end
end

UrbanNews::Issues.print_all_issues
UrbanNews::Issues.all_issue_pages

