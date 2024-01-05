# frozen_string_literal: true

class SearchLog < ApplicationRecord
  validates :search_query, :ip_address, :timestamp, presence: true
  validates :search_query, length: { maximum: 255 }
  validates :ip_address, format: { with: /\A(?:[0-9]{1,3}\.){3}[0-9]{1,3}\z/,
                                   message: 'should be a valid IP address' }
  validates :timestamp, timeliness: { type: :datetime }
end
