# frozen_string_literal: true

class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :statements

  def this_month_statements
    statements.where(
      'created_at > ? AND created_at < ?',
      Time.now.beginning_of_month, Time.now.end_of_month
    )
  end

  def current_month_disposable_income
    statement_rating_for_customer[:disposable_income]
  end

  def current_month_ie_band
    statement_rating_for_customer[:ie_band]
  end

  private

  def statement_rating_for_customer
    @statement_rating_for_customer ||= StatementRatingCalculatorService.call(
      this_month_statements.map(&:statement_items).flatten
    )
  end
end
