# frozen_string_literal: true

FactoryBot.define do
  factory :statement_item do
    title { 'Salary' }
    value { 9.99 }
    transaction_type { 'income' }
    statement
  end
end
