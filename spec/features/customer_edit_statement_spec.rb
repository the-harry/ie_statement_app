# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customer edit statement', type: :feature do
  let(:customer) { create(:customer) }
  let(:statement) { create(:statement, customer:) }
  let(:statement_item) { create(:statement_item, statement:) }

  before do
    statement_item

    sign_in(customer)

    visit statement_path(statement.id)
    click_on 'Edit'

    fill_in 'statement[statement_items_attributes][0][title]', with: 'beans'
    fill_in 'statement[statement_items_attributes][0][amount]', with: 1.99
    select 'expenditure', from: 'statement[statement_items_attributes][0][transaction_type]'
    click_on 'Save Statement'
  end

  it 'creates the statement with nested statement_items' do
    expect(page).to have_content('beans')
    expect(page).to have_content(1.99)
    expect(page).to have_content('Expenditure')
    expect(page).to have_link('Edit')
    expect(page).to have_button('Delete')
  end
end
