# frozen_string_literal: true

class StatementRatingCalculatorService < BaseService
  def call(statements_items)
    income = income_for(statements_items)
    expenditure = expenditure_for(statements_items)

    disposable_income = income - expenditure
    {
      disposable_income:,
      ie_band: ie_rating_for(expenditure, income)
    }
  end

  private

  def ie_rating_for(expenditure, income)
    return 'D' if income <= 0

    ie_ratio = (expenditure / income) * 100

    return 'A' if ie_ratio < 10
    return 'B' if ie_ratio <= 30
    return 'C' if ie_ratio <= 50

    'D'
  end

  def income_for(statements_items)
    statements_items.select do |item|
      item.transaction_type == 'income'
    end.sum(&:amount)
  end

  def expenditure_for(statements_items)
    statements_items.select do |item|
      item.transaction_type == 'expenditure'
    end.sum(&:amount)
  end
end
