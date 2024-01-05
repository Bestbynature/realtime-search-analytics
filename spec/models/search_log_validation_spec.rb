# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchLog, type: :model do
  describe 'validations' do
    subject(:search_log) { SearchLog.new }

    it 'validates presence of search_query, ip_address, and timestamp' do
      search_log.valid?

      expect(search_log.errors[:search_query]).to include("can't be blank")
      expect(search_log.errors[:ip_address]).to include("can't be blank")
      expect(search_log.errors[:timestamp]).to include("can't be blank")
    end

    context 'when search_query exceeds maximum length' do
      it 'validates maximum length of search_query' do
        long_query = 'a' * 256
        search_log.search_query = long_query
        search_log.valid?

        expect(search_log.errors[:search_query]).to include('is too long (maximum is 255 characters)')
      end
    end
  end
end
