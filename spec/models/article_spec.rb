# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      article = Article.new(title: 'Sample Title', author: 'Sample Author', body: 'Sample Content')
      expect(article).to be_valid
    end

    it 'is invalid without an author' do
      article = Article.new(title: 'Sample Title', body: 'Sample Content')
      expect(article).not_to be_valid
    end

    it 'is invalid without a body' do
      article = Article.new(title: 'Sample Title', author: 'Sample Author')
      expect(article).not_to be_valid
    end

    it 'is not valid without a title' do
      article = Article.new(body: 'Sample Content')
      expect(article).not_to be_valid
    end
  end
end
