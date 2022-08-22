require 'pry'

module UrbanNews
  class Story

    @@all = []

    attr_accessor :title, :description, :metadata

    def initialize(title, description, metadata)
      @title = title
      @description = description
      @metadata = metadata 
    end


    def self.all
      @@all
    end

  end
end