# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customer deletes a statement', type: :feature do
  let(:customer) { create(:customer) }
  let(:statement) { create(:statement, customer:) }

  before do
    statement

    sign_in(customer)
    visit statement_path(statement.id)
    click_on 'Delete'
  end

  it 'deletes the statement' do
    expect(page).to have_content('Statement was successfully destroyed.')
  end
end
