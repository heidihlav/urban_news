require_relative "../urban_news.rb"

require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
  class Scraper

    def get_page
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/urban-edge/"))
    end


    def scrape_blog_page
      blog_page = self.get_page
   # blog_page = Nokogiri::HTML(URI.open('https://kinder.rice.edu/urban-edge/'))
      teasers = []
      blog_page.css('#block-views-blog-posts-top .view-content').each do |t|
        t.css('.item').each do |i|
          teaser_url = i.attr('href').to_s
          teaser_description = i.css('.item-description').text
          teaser_title = i.css('.item-title').text
          teaser_metadata = i.css('.item-meta-content')
          teasers << { title: teaser_title, description: teaser_description, url: teaser_url, metadata: teaser_metadata }
        end
      end
      teasers
    end
    
    
    def scrape_story_pages
      stories = {}
      story_pages = Nokogiri::HTML(URI.open('https://kinder.rice.edu/urban-edge/'))
      links = story_pages.css('#block-views-blog-posts-top .item a').map { |u| "https://kinder.rice.edu#{u['href']}" }
      links.each do |link|
        if link.include?('stephen-klineberg-retrospective')
          puts "Stephen Klineberg: A retrospective
          Houston understands itself a little more clearly thanks to 40 years of insight from this Rice social psychologist turned urban visionary.
          by Rose Rougeau Kinder Institute for Urban Research
          May 4, 2022"
        elsif !link.include?('stephen-klineberg-retrospective')
          open_link = Nokogiri::HTML(URI.open(link))
          puts open_link.css('div.content').text
          stories[:content] = link
        end
      end
    end
    # stories
  
  def make_stories
      self.scrape_blog_page.each do |s|
     UrbanNews::Story.new_from_blog_page(s)
      end
    end
  
    def kinder_intro #gsub extra spaces btwn paragraphs?
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issues"))
      intro = doc.css("div .main div .content").text.split("   ")
      puts "#{intro[3]}""#{intro[4]}"
    end

  
    # def self.make_top_stories
    #   stories = []
    #   get_top_stories.each do |s|
    #     title = s.css(".item-title").map{ |t| t.text }
    #     description = s.css(".item-description").map{ |d| d.text }
    #     metadata = s.css(".item-meta-content .item-date span").map { |m| m.text.strip}
    #     url = s.css("a").map { |u| "https://kinder.rice.edu#{u["href"]}" }
    #   stories << {title: title, description: description, metadata: metadata, url: url}
    #   end
    #   stories
    # end

    # binding.pry

    def get_latest_story
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/urban-edge/"))
      title = doc.css(".featured-item.Urban.Edge .item-title").text
      description = doc.css(".featured-item.Urban.Edge .item-description").text
      metadata = doc.css(".featured-item.Urban.Edge .item-meta-content").text
      "#{title}" "\n\n#{description}" "#{metadata}"
    end


  end
end


# UrbanNews::Scraper.all_issues_list_by_index(self)


