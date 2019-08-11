# frozen_string_literal: true

json.array! @tables, partial: 'tables/table', as: :table
