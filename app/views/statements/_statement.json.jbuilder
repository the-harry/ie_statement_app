# frozen_string_literal: true

json.extract! statement, :id, :disposable_income, :ie_rating, :customer_id,
              :created_at, :updated_at
json.url statement_url(statement, format: :json)
