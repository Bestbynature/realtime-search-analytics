# frozen_string_literal: true

class CreateSearchLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :search_logs do |t|
      t.string :search_query
      t.string :ip_address
      t.datetime :timestamp

      t.timestamps
    end
  end
end
