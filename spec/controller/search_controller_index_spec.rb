# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #index' do
    it 'assigns @results' do
      allow(controller).to receive(:search_for_articles).and_return(Article.all)

      get :index, format: :turbo_stream
      expect(assigns(:results)).to eq(Article.all)
    end

    it 'logs search if query is present' do
      query = 'Test Query'
      expect { get :index, params: { query: }, format: :turbo_stream }.to change { SearchLog.count }.by(1)
    end

    it 'does not log search if query is blank' do
      expect { get :index, params: { query: '' }, format: :turbo_stream }.not_to(change { SearchLog.count })
    end
  end
end
