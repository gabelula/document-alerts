require 'httparty'
require 'json'
require 'uri'

class Searcher
  PER_PAGE = 1000
  attr_accessor :keywords

  def self.per_page
    PER_PAGE
  end

  def per_page
    self.class.per_page
  end

  def initialize(keywords)
    @keywords = URI.escape(keywords)
  end

  def call
    JSON.parse(HTTParty.get(query_url).body)
  end

  def query_url
    "https://www.documentcloud.org/api/search.json?q=#{keywords}&per_page=#{per_page}"
  end
end
