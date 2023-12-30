# frozen_string_literal: true

class StatementItem < ApplicationRecord
  belongs_to :statement

  validates_presence_of :statement, :title, :amount, :transaction_type
end
