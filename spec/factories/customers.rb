# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    email { "#{SecureRandom.uuid}@email.com" }
    password { 'somethingstronghere' }
  end
end
