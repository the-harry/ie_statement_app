# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customer create statement', type: :feature do
  let(:customer) { create(:customer) }

  before do
    sign_in(customer)

    visit statements_path
    click_on 'New statement'

    fill_in 'statement[statement_items_attributes][0][title]', with: 'coffee'
    fill_in 'statement[statement_items_attributes][0][amount]', with: 5.99
    select 'income', from: 'statement[statement_items_attributes][0][transaction_type]'
    click_on 'Save Statement'
  end

  it 'creates the statement with nested statement_items' do
    expect(page).to have_content('coffee')
    expect(page).to have_content(5.99)
    expect(page).to have_content('income')
    expect(page).to have_link('Edit')
    expect(page).to have_button('Delete')
  end
end
