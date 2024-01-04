class Article < ApplicationRecord
  searchkick text_middle: [:title, :body, :author]
end

Model.reindex