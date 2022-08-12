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
      @url = []
    end

    def self.print_all_issues
      @name = UrbanNews::Scraper.all_issues_list_by_index(self)
        @name.collect.with_index(0) do |char, i| 
          puts "#{i} #{char}" unless i == 0
        end 
    end

    def self.user_select_an_issue
      self.print_all_issues.each do |i|
        HTML(URI.open("https://kinder.rice.edu/issues"))
      

    end

    # def self.all_issue_pages
    #   @url = UrbanNews::Scraper.issue_page_url
    #   @url.collect.with_index(1) do |char, i|
    #      @url = puts "#{i}" "#{@name}" "https://kinder.rice.edu" + "#{char}" unless i == 0
    #   end
    #   @url
    # end 

    # def self.user_select_an_issue
    #   self.print_all_issues
    #     self.all_issue_pages
    #     "#{name}" "#{url}" 
    #     (href="https://kinder.rice.edu/issue/covid-19-and-cities")
    #     (href="https://kinder.rice.edu/issue/demographics")
        # <a href="https://kinder.rice.edu/issue/economic-development" target="_self"></a>
        # <a href="https://kinder.rice.edu/issue/education" target="_self"></a>
        # <a href="https://kinder.rice.edu/issue/elections" target="_self"></a>
        # <a href="https://kinder.rice.edu/issue/governance" target="_self"></a>
        # <a href="https://kinder.rice.edu/issue/health" target="_self"></a>
        # <a href="https://kinder.rice.edu/issue/housing" target="_self"></a>
        # <a href="https://kinder.rice.edu/issue/hurricane-harvey" target="_self"></a>
        # <a href="https://kinder.rice.edu/issue/immigration" target="_self"></a>
        # <a href="https://kinder.rice.edu/issue/sun-belt" target="_self"></a>
        # <a href="https://kinder.rice.edu/issue/transportation" target="_self"></a>
        # <a href="https://kinder.rice.edu/issue/urban-disparity" target="_self"></a>
        # <a href="https://kinder.rice.edu/issue/urban-planning" target="_self"></a>





    # end


    # def self.user_choose_issue
    #     puts "Which issue do you want to read about?"
    #     number_chosen = gets.strip.to_i
        # if number_chosen ==  


    end
end

UrbanNews::Issues.print_all_issues
UrbanNews::Issues.user_select_an_issue


