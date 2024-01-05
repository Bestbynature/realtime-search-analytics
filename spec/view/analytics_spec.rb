# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SearchLogs analytics page', type: :feature do
  before(:each) do
    @search_logs = FactoryBot.create_list(:search_log, 5)
  end

  it "displays 'Back to Articles' link" do
    visit analytics_path
    expect(page).to have_link('Back to Articles', href: articles_path)
  end

  it 'displays search query counts' do
    @search_logs = FactoryBot.create_list(:search_log, 10)

    visit analytics_path

    @search_logs.each do |search_log|
      expect(page).to have_content(search_log.search_query)
      expect(page).to have_content('Articles')
    end
  end

  it 'displays a column chart for search trends' do
    visit analytics_path
    expect(page).to have_css('#searchTrendChart')
  end

  it 'displays a pie chart for search trends' do
    visit analytics_path
    expect(page).to have_css('#searchTrendChart')
  end
end
