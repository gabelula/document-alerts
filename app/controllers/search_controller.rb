class SearchController < ApplicationController

  def index
    # This should be replaced by:
    page = params.fetch(:page, 1)
    query = params[:query]

    @results = DocumentcloudSearcherService.new(query, page).call

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @results }
    end
  end

end
