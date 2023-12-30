# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'statements/edit', type: :view do
  let(:statement) do
    Statement.create!(
      disposable_income: '9.99',
      ie_rating: 'MyString',
      customer: nil
    )
  end

  before(:each) do
    assign(:statement, statement)
  end

  it 'renders the edit statement form' do
    render

    assert_select 'form[action=?][method=?]', statement_path(statement), 'post' do
      assert_select 'input[name=?]', 'statement[disposable_income]'

      assert_select 'input[name=?]', 'statement[ie_rating]'

      assert_select 'input[name=?]', 'statement[customer_id]'
    end
  end
end
