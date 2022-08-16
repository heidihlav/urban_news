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

    # def self.issue_page_url
    #   doc = Nokogiri::HTML(URI.open('https://kinder.rice.edu/issues'))
    #   issues = doc.css('.view-content a[href^="/issue/"]')
    #   issues.collect do |i|
    #     puts url = i.delete('href')
    #     # url
    #   end
    # end

    # def self.all_issues_list_by_index(issues)
    #   doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issues"))
    #   puts issues = doc.css(".view-content .issue").text.split("  
    #     ")
    #     # binding.pry
    # end

    def self.latest_stories_heading
        doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issues"))
        puts heading = doc.css(".block__title").first.text
    end

    def self.get_urls
      #   ISSUE_URLS.each do |url|
      #     puts url
      #    url =         Nokogiri::HTML(URI.open("https://kinder.rice.edu/issue#{url}"))
      #   name = url.css("#page-header .title").text
      #   UrbanNews::Issues.new(name, url).save
      # end
      # end
    
    def self.get_articles
      UrbanNews::Issues.all.each do |url|
        url = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issue#{url}")) 
        title = url.css("h3").text
        description = url.css(".item-description").text
        meta_data = url.css(".item-meta-content").text
      UrbanNews::Article.new(title, description, meta_data).save
     end

    # def self.article_title
    #   doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issues"))
    #   titles = doc.css("h3")
    #     titles.collect do |t|
    #       puts t.text.split("h3")
    #     end
    # end

    # def self.article_description
    #   doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issues"))
    #   puts descriptions = doc.css(".item-description p").text
    # end


    # def self.article_meta_data
    #   doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issues"))
    #   puts doc.css(".item-meta-content").text
    # end


    



    end
end

UrbanNews::Scraper.kinder_intro
# UrbanNews::Scraper.issue_page_url
UrbanNews::Scraper.all_issues_list_by_index(self)
UrbanNews::Scraper.latest_stories_heading
UrbanNews::Scraper.article_title
UrbanNews::Scraper.article_description
UrbanNews::Scraper.article_meta_data


