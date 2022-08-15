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
      "/demographics",
      "/economic-development",
      "/education", 
      "/elections",
      "/governance",
      "/health", 
      "/housing",
      "/hurricane-harvey",
      "/immigration", 
      "/sun-belt",
      "/transportation",
      "/urban-disparity",
      "/urban-planning"]
    

    def initialize(name, url)
      @name = name
      @url = url
      save
    end

    def self.all
      @@all
    end

    def save
      @@all << self
    end


    def self.get_urls
      ISSUE_URLS.each do |url|
        url = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issue#{url}")) 
        name = url.css(".view-content .issue")
        UrbanNews::Issues.new(name, url).save
       end
    end

    binding.pry


    # def self.print_all_issues
    #   @name = UrbanNews::Scraper.all_issues_list_by_index(self)
    #     @name.collect.with_index(0) do |char, i| 
    #       puts "#{i} #{char}" unless i == 0
    #     end 
    # end

    end
end

# UrbanNews::Issues.print_all_issues
# UrbanNews::Issues.issue_urls
# UrbanNews::Issues.get_urls
# UrbanNews::Issues.new(name, url)


