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

  def call(page=1)
    JSON.parse(HTTParty.get(query_url(page)).body)
  end

  def query_url(page=1)
    "https://www.documentcloud.org/api/search.json?q=#{keywords}&per_page=#{per_page}&page=#{page}"
  end
end
