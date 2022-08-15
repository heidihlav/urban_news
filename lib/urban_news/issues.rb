#issues has many articles
# class UrbanNews::Issues
require_relative "scraper.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
    class Issues
    attr_accessor :name, :url 
    @@all = []

    ISSUE_URLS = ["/covid-19-and-cities",
      "https://kinder.rice.edu/issue/demographics",
      "https://kinder.rice.edu/issue/economic-development",
      "https://kinder.rice.edu/issue/education", 
      "https://kinder.rice.edu/issue/elections",
      "https://kinder.rice.edu/issue/governance",
      "https://kinder.rice.edu/issue/health", 
      "https://kinder.rice.edu/issue/housing",
      "https://kinder.rice.edu/issue/hurricane-harvey",
      "https://kinder.rice.edu/issue/immigration", 
      "https://kinder.rice.edu/issue/sun-belt",
      "https://kinder.rice.edu/issue/transportation",
      "https://kinder.rice.edu/issue/urban-disparity",
      "https://kinder.rice.edu/issue/urban-planning"]
    

    def initialize(name, url)
      @name = name
      @url = url
      save
    end

    def self.all
      @@all
    end

    def self.get_urls
      ISSUE_URLS.each do |url|
        doc = Nokogiri::HTML(URI.open('https://kinder.rice.edu/issue #{url}'))
        UrbanNews::Issues.new(doc.css(".view-content .issue"))
       end
    end
    # def self.print_all_issues
    #   @name = UrbanNews::Scraper.all_issues_list_by_index(self)
    #     @name.collect.with_index(0) do |char, i| 
    #       puts "#{i} #{char}" unless i == 0
    #     end 
    # end

    
# binding.pry

    end
end

# UrbanNews::Issues.print_all_issues
# UrbanNews::Issues.issue_urls
UrbanNews::Issues.get_urls


