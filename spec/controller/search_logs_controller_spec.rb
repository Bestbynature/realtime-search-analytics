# frozen_string_literal: true

RSpec.describe SearchLogsController, type: :controller do
  describe 'GET #analytics' do
    let!(:search_logs) { create_list(:search_log, 10) }

    it 'assigns @search_logs' do
      get :analytics
      expect(assigns(:search_logs)).to be_present
    end

    it 'renders the analytics template' do
      get :analytics
      expect(response).to render_template('analytics')
    end

    it 'displays the top 10 search queries' do
      get :analytics
      expect(assigns(:search_logs)).to include(['Sample query', 10])
    end

    it 'handles edge cases - empty search logs' do
      SearchLog.destroy_all
      get :analytics
      expect(assigns(:search_logs)).to be_empty
    end
  end
end
