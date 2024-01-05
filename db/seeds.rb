# frozen_string_literal: true

50.times do |_i|
  Article.create(title: Faker::Book.title,
                 body: Faker::Lorem.paragraph(sentence_count: 4),
                 author: Faker::Book.author)
end

Article.reindex
