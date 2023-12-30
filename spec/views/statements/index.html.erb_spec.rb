# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'statements/index', type: :view do
  before(:each) do
    assign(:statements, [
             Statement.create!(
               disposable_income: '9.99',
               ie_rating: 'Ie Rating',
               customer: nil
             ),
             Statement.create!(
               disposable_income: '9.99',
               ie_rating: 'Ie Rating',
               customer: nil
             )
           ])
  end

  it 'renders a list of statements' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Ie Rating'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
