# frozen_string_literal: true

class StatementItem < ApplicationRecord
  belongs_to :statement

  validates_presence_of :statement, :title, :amount, :transaction_type

  after_commit :update_statement

  private

  def update_statement
    res = StatementRatingCalculatorService.call(statement.statement_items)

    statement.update(
      disposable_income: res[:disposable_income],
      ie_rating: res[:ie_band]
    )
  end
end
