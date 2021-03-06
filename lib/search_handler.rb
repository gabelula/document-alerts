class SearchHandler
  attr_reader :alert, :pages, :resuts

  def initialize(alert)
    @alert = alert
    @pages = []
  end

  def call
    search_results
    store_results
  end

private

  def search_results
    results = Searcher.new(alert.keyword).call
    if results['total'] > results_per_page
      pages << results['documents']
      other_pages(results['total'])
    else
      @results = results['documents']
    end
  end

  def search_ids
    @results.map { |result| result['id'] }
  end

  def other_pages(total_results)
    pages_count = (total_results / results_per_page).ceil
    (2...pages_count).to_a.each do |page| # Page #1 is already loaded
      results = Searcher.new(alert.keyword).call(page)
      pages << results['documents']
    end
    @results = pages.flatten
  end

  def store_results
    user = alert.user
    new_search_ids = search_ids - existing_findings_ids
    new_search_ids.each do |search_id|
      result = result_for(search_id, new_search_ids)
      Finding.create documentcloud_id: search_id, alert_id: alert.id
      NonSentResult.create alert_id: alert.id,
        title: result['title'],
        canonical_url: result['canonical_url'],
        description: result['description'],
        documentcloud_id: result['id'],
        resources: ""
    end
  end

  def existing_findings_ids
    Finding.where(alert_id: alert.id).
      select(:documentcloud_id).map { |finding| finding.documentcloud_id }
  end

  def new_results(new_search_ids)
    @new_results ||= @results.select do |result|
      new_search_ids.include?(result['id'])
    end
  end

  def result_for(documentcloud_id, new_search_ids)
    new_results(new_search_ids).detect { |r| r['id'] == documentcloud_id }
  end

  def results_per_page
    Searcher.per_page
  end
end
