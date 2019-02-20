# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Purchases', type: :request do
  describe 'GET /purchases' do
    it 'works!' do
      get purchases_path
      expect(response).to have_http_status(200)
    end
  end
end
