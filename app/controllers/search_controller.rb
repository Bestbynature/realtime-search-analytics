class SearchController < ApplicationController
  def index
    @results = search_for_articles

    log_search(params[:query]) unless params[:query].blank?

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("articles", partial: "articles/articles", locals: { articles: @results })
      end
    end
  end

  def suggestions
    @results = search_for_articles

    log_search(params[:query]) unless params[:query].blank?

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("suggestions", partial: "search/suggestions", locals: { results: @results })
      end
    end
  end

  private

  def search_for_articles
    if params[:query].blank?
      Article.all
    else
      Article.search(params[:query], fields: [:title, :body, :author], operator: "or", match: :text_middle)
    end
  end

  def log_search(query)
    existing_query = SearchLog.where(ip_address: request.remote_ip).last
  
    if query.present?
      if existing_query && query.include?(existing_query.search_query)
        existing_query.update(search_query: query)
      else
        SearchLog.create(
          search_query: query,
          ip_address: request.remote_ip,
          timestamp: Time.now
        )
      end
    elsif existing_query
      existing_query.destroy
    end
  end
end


