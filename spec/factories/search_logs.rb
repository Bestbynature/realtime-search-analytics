# frozen_string_literal: true

FactoryBot.define do
  factory :search_log do
    search_query { 'Sample query' }
    ip_address { '192.168.1.1' }
    timestamp { Time.now }
  end
end
