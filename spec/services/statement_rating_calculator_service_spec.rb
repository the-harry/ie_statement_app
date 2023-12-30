# frozen_string_literal: true

require 'rails_helper'

describe StatementRatingCalculatorService do
  let(:statement) { create(:statement) }
  let(:statements_income) do
    create(:statement_item, transaction_type: 'income', title: 'salary',
                            amount: income, statement:)
  end
  let(:statements_expenditure) do
    create(:statement_item, transaction_type: 'expenditure', title: 'rent',
                            amount: expenditure, statement:)
  end

  describe '.call' do
    let(:subject) do
      described_class.call([statements_income, statements_expenditure])
    end

    before do
      statements_income
      statements_expenditure
      statement.reload
    end

    context 'when it is band A' do
      let(:income) { 100 }
      let(:expenditure) { 5 }

      it 'returns the correct rating' do
        expect(subject[:disposable_income].to_f).to eq(95.0)
        expect(subject[:ie_band]).to eq('A')
      end
    end

    context 'when it is band B' do
      let(:income) { 100 }
      let(:expenditure) { 25 }

      it 'returns the correct rating' do
        expect(subject[:disposable_income].to_f).to eq(75.0)
        expect(subject[:ie_band]).to eq('B')
      end
    end

    context 'when it is band C' do
      let(:income) { 100 }
      let(:expenditure) { 50 }

      it 'returns the correct rating' do
        expect(subject[:disposable_income].to_f).to eq(50.0)
        expect(subject[:ie_band]).to eq('C')
      end
    end

    context 'when it is band D' do
      let(:income) { 100 }
      let(:expenditure) { 60 }

      it 'returns the correct rating' do
        expect(subject[:disposable_income].to_f).to eq(40.0)
        expect(subject[:ie_band]).to eq('D')
      end
    end

    context 'when income is less than or equal to 0' do
      let(:income) { 0 }
      let(:expenditure) { 10 }

      it 'returns the correct rating' do
        expect(subject[:ie_band]).to eq('D')
        expect(subject[:disposable_income].to_f).to eq(-10.0)
      end
    end
  end
end
