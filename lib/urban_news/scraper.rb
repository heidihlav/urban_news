require_relative "../urban_news.rb"

require 'nokogiri'
require 'open-uri'
require 'pry'

module UrbanNews
  class Scraper

    # def get_page
    #   doc = Nokogiri::HTML(URI.open("https://kinder.rice.edu/urban-edge/"))
    # end

    def self.scrape_blog_page
      latest_posts = Nokogiri::HTML(URI.open('https://kinder.rice.edu/urbanedge'))
      articles = []
        latest_posts.css('.article.article--info').each do |post|
          article_title = post.css('.article__news-list-summary-label strong').text
            article_summary = post.css('p.summary').text
              article_credit = post.css('div.created').text
                post.css('a.article__news-list-summary-label[href]').collect do |link|
                  article_url = "https://kinder.rice.edu/#{link['href']}"
                  open_link = Nokogiri::HTML(URI.open("#{article_url}"))
                    article_content = open_link.css('.article__body').text.strip
      articles << { title: article_title, summary: article_summary, date: article_credit, url: article_url, content: article_content } 
        end
      end
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


