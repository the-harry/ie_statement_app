# frozen_string_literal: true

FactoryBot.define do
  factory :statement do
    disposable_income { 9.99 }
    ie_rating { 'A' }

    customer
  end
end
