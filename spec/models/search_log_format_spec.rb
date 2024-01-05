# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchLog, type: :model do
  describe 'validations' do
    subject(:search_log) { SearchLog.new }

    context 'when ip_address format is invalid' do
      it 'validates format of ip_address' do
        invalid_ip = 'invalid_ip_address'
        search_log.ip_address = invalid_ip
        search_log.valid?

        expect(search_log.errors[:ip_address]).to include('should be a valid IP address')
      end
    end

    context 'when timestamp format is invalid' do
      it 'validates timestamp format' do
        search_log.timestamp = 'invalid_timestamp'
        search_log.valid?

        expect(search_log.errors[:timestamp]).to include('is not a valid datetime')
      end
    end
  end
end
