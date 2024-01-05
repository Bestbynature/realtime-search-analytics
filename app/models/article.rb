# frozen_string_literal: true

class Article < ApplicationRecord
  searchkick text_middle: %i[title body author]

  after_save :reindex_article

  validates :title, :author, :body, presence: true
  validates :title, length: { minimum: 6 }

  private

  def reindex_article
    Article.reindex
  end
end
