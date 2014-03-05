class DocumentcloudSearcherService
  attr_reader :page
  DocumentcloudSearch = Struct.new(:title, :created_at, :description, :link)

  def initialize(str, page=1)
    @str = str
    @page = page
  end

  def call
    searcher = Searcher.new(@str, per_page: 10, page: page)
    parse(searcher.call)
  end

  def parse(results)
    results['documents'].map do |result|
      DocumentcloudSearch.new(result['title'],
                              result['created_at'],
                              result['description'],
                              result['canonical_url'])
    end
  end
end
