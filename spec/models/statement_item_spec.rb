# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatementItem, type: :model do
  it { is_expected.to validate_presence_of(:statement) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:transaction_type) }
end
