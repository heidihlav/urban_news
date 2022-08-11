require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
    class Scraper

    def self.kinder_intro
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issues"))
      intro = doc.css("div .main div .content").text.split("    ")
      puts "#{intro[3]}" 
      puts "#{intro[4]}"
    end

    def self.issue_page_url
      doc = Nokogiri::HTML(URI.open('https://kinder.rice.edu/issues'))
        issues = doc.css('div a[href^="/issue/"]')
      issues.collect do |i|
        issue_page_url = i.each do |link|
        puts "#{link[1]}"
        end
          issue_page_url
      end
    end

    def self.all_issues_list_by_index(issues)
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issues"))
      puts issue_names = doc.css(".view-content .issue").text.split("  
        ")
    end

    def self.latest_stories_heading
        doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issue/covid-19-and-cities"))
        puts heading = doc.css(".block__title").first.text
    end

    # def self.article_teaser
    #   doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issue/covid-19-and-cities"))
    #   puts doc.css(".item-content")[0..3].text
    # end

    def self.article_title
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issue/covid-19-and-cities"))
      titles = doc.css("h3")
        titles.collect do |t|
          puts t.text.split("h3")
        end
    end

    def self.article_description
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issue/covid-19-and-cities"))
      puts descriptions = doc.css(".item-description p").text
    end


    def self.article_meta_data
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issue/covid-19-and-cities"))
      puts doc.css(".item-meta-content").text
    end


    



    end
end

UrbanNews::Scraper.kinder_intro
UrbanNews::Scraper.issue_page_url

UrbanNews::Scraper.all_issues_list_by_index(self)
UrbanNews::Scraper.latest_stories_heading
# UrbanNews::Scraper.article_teaser
UrbanNews::Scraper.article_title
UrbanNews::Scraper.article_description
UrbanNews::Scraper.article_meta_data


