require_relative "../urban_news.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
  class Scraper

    def self.scrape_blog_page
      latest_posts = Nokogiri::HTML(URI.open('https://kinder.rice.edu/urbanedge'))
      stories = []
        latest_posts.css('.article.article--info').each do |post|
          story_title = post.css('.article__news-list-summary-label strong').text
            story_summary = post.css('p.summary').text
              story_credit = post.css('div.created').text
                post.css('a.article__news-list-summary-label[href]').collect do |link|
                  story_url = "https://kinder.rice.edu#{link['href']}"
                  open_link = Nokogiri::HTML(URI.open("#{story_url}"))
                  story_content = open_link.css('.article__body').text.strip
        stories << { title: story_title, summary: story_summary, credit: story_credit, url: story_url, content: story_content } 
                end
        end
      stories
    end
    
    def self.make_stories
      scrape_blog_page.each do |s| 
        UrbanNews::Story.new_from_blog_page(s)
      end
    end
  

  
  end
end


