# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'statements/new', type: :view do
  before(:each) do
    assign(:statement, Statement.new(
                         disposable_income: '9.99',
                         ie_rating: 'MyString',
                         customer: nil
                       ))
  end

  it 'renders new statement form' do
    render

    assert_select 'form[action=?][method=?]', statements_path, 'post' do
      assert_select 'input[name=?]', 'statement[disposable_income]'

      assert_select 'input[name=?]', 'statement[ie_rating]'

      assert_select 'input[name=?]', 'statement[customer_id]'
    end
  end
end
