# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customer view details of a statement', type: :feature do
  let(:customer) { create(:customer) }

  context 'when no statement item is availiable on statement#show' do
    let(:statement) { create(:statement, customer:) }

    before do
      statement

      sign_in(customer)
      visit statements_path
      click_on '👀'
    end

    it 'renders the statement data' do
      expect(page)
        .to have_content("Disposable income: £#{statement.disposable_income}")

      expect(page).to have_content("Ie rating: #{statement.ie_rating}")

      expect(page).to have_content("Customer: #{statement.customer.email}")

      expect(page).to have_content("Creation date: #{statement.created_at}")
    end

    it 'renders a message' do
      expect(page).to have_content('No statement items...')
    end

    it 'renders the standard links' do
      expect(page).to have_link('Edit')
      expect(page).to have_button('Delete')
      expect(page).to have_link('Back to statements')
    end
  end

  context 'when some statement is availiable on statement#show' do
    let(:statement) { create(:statement, customer:) }
    let(:statement_item) { create(:statement_item, statement:) }

    before do
      statement
      statement_item

      sign_in(customer)
      visit statements_path
      click_on '👀'
    end

    it 'renders the statement data' do
      expect(page)
        .to have_content("Disposable income: £#{statement.disposable_income}")

      expect(page).to have_content("Ie rating: #{statement.ie_rating}")

      expect(page).to have_content("Customer: #{statement.customer.email}")

      expect(page).to have_content("Creation date: #{statement.created_at}")
    end

    it 'renders the standard links' do
      expect(page).to have_link('Edit')
      expect(page).to have_button('Delete')
      expect(page).to have_link('Back to statements')
    end

    it 'renders the statement items in a table' do
      expect(page).to have_content('Income')
      expect(page).to have_content(statement_item.title)
      expect(page).to have_content('Amount')
      expect(page).to have_content(statement_item.amount)
      expect(page).to have_content('Expenditure')
      expect(page).to have_content('')
      expect(page).to have_content('Amount')
      expect(page).to have_content('')
    end
  end
end
