# frozen_string_literal: true

json.extract! table, :id, :number, :created_at, :updated_at
json.url table_url(table, format: :json)
