# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'purchases/index', type: :view do
  before(:each) do
    assign(:purchases, [
      FactoryBot.build(:purchase),
      FactoryBot.build(:purchase)
    ])
  end

  it 'renders a list of purchases' do
    render
  end
end
