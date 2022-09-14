require_relative "../urban_news.rb"

require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
  class Scraper

    def get_page
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/urban-edge/"))
    end

    def self.scrape_blog_page
    blog_page = Nokogiri::HTML(URI.open('https://kinder.rice.edu/urban-edge/'))
      stories = []
      blog_page.css('#block-views-blog-posts-top .view-content').each do |t|
        t.css('.item').each do |i|
          teaser_description = i.css('.item-description').text
          teaser_title = i.css('.item-title').text
          teaser_metadata = i.css('.date-display-single').children.text
            links = i.css('a').map { |u| "https://kinder.rice.edu#{u['href']}" }
              links.each do |link|
                story_url = link
                open_link = Nokogiri::HTML(URI.open(link))
                story_content = open_link.css('div.content').text.strip
      stories << { title: teaser_title, description: teaser_description, metadata: teaser_metadata, url: story_url, content: story_content } 
          end
        end
      end
      stories
    end
    
    def self.make_stories
      scrape_blog_page.each do |s| 
        UrbanNews::Story.new_from_blog_page(s)
      end
    end
  
    def self.kinder_intro #gsub extra spaces btwn paragraphs?
      doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/issues"))
        intro = doc.css("div .main div .content").text.split("   ")
      puts "#{intro[3]}""#{intro[4]}"
    end


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


