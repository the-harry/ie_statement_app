# frozen_string_literal: true

class Statement < ApplicationRecord
  belongs_to :customer
  has_many :statement_items, dependent: :delete_all
  accepts_nested_attributes_for :statement_items, allow_destroy: true,
                                                  reject_if: :destroy_marked?

  validates_presence_of :customer

  private

  def destroy_marked?(attributes)
    attributes['_destroy'] == '1'
  end
end
