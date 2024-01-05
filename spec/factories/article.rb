# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'Sample Title' }
    body { 'Sample Body' }
    author { 'Sample Author' }
  end
end
