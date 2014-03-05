class SearchController < ApplicationController

  def index
    # This should be replaced by:
    # @results = DocumentcloudSearcherService.new("str", params[:page]).call

    # TODO: remove all the example queries
    @results = [
      {
        document_id:      1,
        document_url:     "https://www.documentcloud.org/documents/1033387-test-uploading-la-diaria-newspaper.html",
        document_title:   "Enriched soil at a trade agreement.",
        document_date:    Time.now,
        document_summary: "Related to Trade Agreements Compliance.-- (1) Required determination; adjustment.--If the Secretary determines that expenditures under this title that are subject to the total allowable domestic support levels under the Uruguay Round Agreements (as defined in section 2 of the Uruguay Round Agreements Act (19 U.S.C. 3501)) will exceed such allowable levels for any applicable reporting period, the Secretary shall, to the maximum extent practicable, make adjustments in the amount of such expenditure...  "
      },
      {
        document_id:      2,
        document_url:     "https://www.documentcloud.org/documents/1033387-test-uploading-la-diaria-newspaper.html",
        document_title:   "Related with Compliance",
        document_date:    Time.now,
        document_summary: "Related to Trade Agreements Compliance.-- (1) Required determination; adjustment.--If the Secretary determines that expenditures under this title that are subject to the total allowable domestic support levels under the Uruguay Round Agreements (as defined in section 2 of the Uruguay Round Agreements Act (19 U.S.C. 3501)) will exceed such allowable levels for any applicable reporting period, the Secretary shall, to the maximum extent practicable, make adjustments in the amount of such expenditure... "
      }
    ]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @results }
    end
  end

end
