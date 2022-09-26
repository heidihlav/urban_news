require_relative "../urban_news.rb"

require 'pry'

module UrbanNews
  class Story

    attr_accessor :title, :summary, :credit, :url, :content
    @@all = []

    def self.new_from_blog_page(a)
      self.new(a[:title], a[:summary], a[:credit], a[:url], a[:content])
    end

    def initialize(title, summary, credit, url, content)
      @title = title
      @summary = summary
      @credit = credit
      @url = url
      @content = content
      @@all << self
    end

    def self.all
      @@all
    end

    def self.find(id)
      self.all[id-1]
    end

    def self.latest_posts
      # top_stories_by_index = []
      self.all.each do |article|
       puts "#{article.title}"
       puts "#{article.summary}"
       puts "#{article.credit}"
       puts "#{article.url}"
       puts "#{article.content}"
      end
    end

    # def self.top_stories_content
    #   self.top_stories.with_index do |story, index|
    #     puts "#{index+1}." 
    #     puts "#{story.url}"
    #     puts "#{story.content}"
    #    end
    # end

  end
end

