# frozen_string_literal: true

class Statement < ApplicationRecord
  belongs_to :customer
  has_many :statement_items, dependent: :delete_all
  accepts_nested_attributes_for :statement_items, allow_destroy: true

  validates_presence_of :customer
end
