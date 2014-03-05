class SearchController < ApplicationController

  def index
    # This should be replaced by:
    page = params.fetch(:page, 1)
    @results = DocumentcloudSearcherService.new("str", page).call

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @results }
    end
  end

end
