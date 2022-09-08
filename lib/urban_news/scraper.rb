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
          # teaser_url = puts blog_page.css('#block-views-blog-posts-top .item a').map { |u| "https://kinder.rice.edu#{u['href']}" }.collect {|f| puts f }
          teaser_description = i.css('.item-description').text
          teaser_title = i.css('.item-title').text
          teaser_metadata = i.css('.date-display-single').children.text
          teasers << { title: teaser_title, description: teaser_description, metadata: teaser_metadata }
        end
      end
      teasers
    end
    
    def scrape_story_pages
      stories = []
      story_pages = Nokogiri::HTML(URI.open('https://kinder.rice.edu/urban-edge/'))
        links = story_pages.css('#block-views-blog-posts-top .item a').map { |u| "https://kinder.rice.edu#{u['href']}" }
          links.each do |link|
          story_url = link
          open_link = Nokogiri::HTML(URI.open(link))
          story_content = open_link.css('div.content').text.strip
       # stories[:content] = link
       stories << { url: story_url, content: story_content }
     end
    stories
    end
    
  def make_stories
      self.scrape_blog_page.each do |s|
     UrbanNews::Story.new_from_blog_page(s)
      end
    end

    def make_content
      self.scrape_story_pages.each do |c|
        UrbanNews::Story.new_from_story_pages(c)
      end
    end
  
    def kinder_intro #gsub extra spaces btwn paragraphs?
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


