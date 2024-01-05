# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @results = search_for_articles
    log_search(params[:query]) unless params[:query].blank?
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('articles', partial: 'articles/articles',
                                                             locals: { articles: @results })
      end
    end
  end

  def suggestions
    @results = search_for_articles
    log_search(params[:query]) unless params[:query].blank?
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('suggestions', partial: 'search/suggestions',
                                                                locals: { results: @results })
      end
    end
  end

  private

  def search_for_articles
    params[:query].blank? ? Article.all : search_articles_by_query
  end

  def search_articles_by_query
    Article.search(params[:query], fields: %i[title body author], operator: 'or', match: :text_middle)
  end

  def log_search(query)
    existing_query = fetch_existing_query

    if query.present?
      update_or_create_query(query, existing_query)
    else
      delete_query(existing_query)
    end
  end

  def fetch_existing_query
    SearchLog.where(ip_address: request.remote_ip).last
  end

  def update_or_create_query(query, existing_query)
    if existing_query && query.include?(existing_query.search_query)
      existing_query.update(search_query: query)
    else
      create_search_log(query)
    end
  end

  def create_search_log(query)
    SearchLog.create(
      search_query: query,
      ip_address: request.remote_ip,
      timestamp: Time.now
    )
  end

  def delete_query(existing_query)
    existing_query&.destroy
  end
end
