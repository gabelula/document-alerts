require 'httparty'
require 'json'
require 'uri'

class Searcher
  PER_PAGE = 1000
  attr_accessor :keywords, :page, :per_page

  def self.per_page
    PER_PAGE
  end

  def initialize(keywords, opt={})
    @page = opt.fetch(:page, 1)
    @per_page = opt.fetch(:per_page, PER_PAGE)
    @keywords = URI.escape(keywords)
  end

  def call
    JSON.parse(HTTParty.get(query_url).body)
  end

  def query_url
    "https://www.documentcloud.org/api/search.json?q=#{keywords}&per_page=#{per_page}&page=#{page}"
  end
end
