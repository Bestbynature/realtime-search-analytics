class Article < ApplicationRecord
  searchkick text_middle: [:title, :body, :author]

  after_save :reindex_article

  private

  def reindex_article
    Article.reindex 
  end
end
