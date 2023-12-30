# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'statements/show', type: :view do
  before(:each) do
    assign(:statement, Statement.create!(
                         disposable_income: '9.99',
                         ie_rating: 'Ie Rating',
                         customer: nil
                       ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Ie Rating/)
    expect(rendered).to match(//)
  end
end
