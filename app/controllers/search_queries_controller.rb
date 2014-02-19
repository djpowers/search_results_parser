class SearchQueriesController < ApplicationController

  def new
    @search_query = SearchQuery.new
  end

  def create
    @search_query = SearchQuery.find_or_create_by(search_query_params)

    if @search_query.save
      @result_group = ResultGroup.create(search_query: @search_query)
      @search_query.parse_ads.each do |ad|
        returned_ad = Ad.find_or_create_by(headline: ad[0], url: ad[1], copy: ad[2])
        @ad_result = AdResult.new(result_group: @result_group, ad: returned_ad)
        @ad_result.save
      end
      redirect_to @search_query
    else
      render 'new'
    end
  end

  def show
    @search_query = SearchQuery.find(params[:id])
  end

  def index
    @search_queries = SearchQuery.all
  end

  private

    def search_query_params
      params.require(:search_query).permit(:terms)
    end

end
