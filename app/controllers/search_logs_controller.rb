class SearchLogsController < ApplicationController
  def analytics
    all_queries = SearchLog.where.not(search_query: nil).pluck(:search_query)

    final_search_queries = []

    all_queries.each do |query|
      is_subset = false
      all_queries.each do |other_query|
        next if query == other_query

        if other_query.include?(query)
          is_subset = true
          break
        end
      end

      final_search_queries << query unless is_subset
    end

    @search_logs = final_search_queries.group_by { |query| query }.transform_values(&:count)
                                          .sort_by { |_key, value| value }.reverse.to_h.first(10)

    render 'analytics'
  end
end