# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles/index.html.erb', type: :view do
  before(:each) do
    articles = [
      FactoryBot.create(:article, title: 'First Article', body: 'Content for first article', author: 'Author 1'),
      FactoryBot.create(:article, title: 'Second Article', body: 'Content for second article', author: 'Author 2'),
      FactoryBot.create(:article, title: 'Third Article', body: 'Content for third article', author: 'Author 3')
    ]

    assign(:articles, articles)
    assign(:notice, 'Your notice message here')
    render
  end

  it "displays the 'Articles' heading" do
    expect(rendered).to have_selector('h1', text: 'Articles')
  end

  it 'renders the search form' do
    expect(rendered).to render_template(partial: 'search/_form')
  end

  it "contains a link to the 'Analytics' page" do
    expect(rendered).to have_link('Analytics', href: analytics_path)
  end

  it 'displays the list of articles' do
    expect(rendered).to render_template(partial: 'articles/_articles')
  end

  it 'contains a link to create a new article' do
    expect(rendered).to have_link('New article', href: new_article_path)
  end
end
