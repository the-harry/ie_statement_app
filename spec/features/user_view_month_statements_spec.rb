# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User view month statements', type: :feature do
  let(:customer) { create(:customer) }

  before { sign_in(customer) }

  context 'when no statement is availiable on statements#index' do
    before { visit statements_path }

    it 'renders the current month' do
      expect(page).to have_content(Date.today.strftime('%B'))
    end

    it 'renders a message' do
      expect(page).to have_content('No statements filed yet.')
    end

    it 'renders the new statemente button' do
      expect(page).to have_link('New statement')
    end
  end

  context 'when some statement is availiable on statements#index' do
    let(:statement) { create(:statement, customer:) }

    before do
      statement

      visit statements_path
    end

    it 'renders the current month' do
      expect(page).to have_content(Date.today.strftime('%B'))
    end

    it 'renders the new statemente button' do
      expect(page).to have_link('New statement')
    end

    it 'renders the values in a table' do
      expect(page).to have_content('Date Of Creation')
      expect(page).to have_content(statement.created_at)
      expect(page).to have_content('I&E Rating')
      expect(page).to have_content(statement.ie_rating)
      expect(page).to have_content('Disposable Income')
      expect(page).to have_content(statement.disposable_income)
      expect(page).to have_content('View Details')
      expect(page).to have_link('👀')
    end
  end
end
