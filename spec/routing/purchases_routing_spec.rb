# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchasesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/purchases').to route_to('purchases#index')
    end

    it 'routes to #import' do
      expect(post: '/purchases/import').to route_to('purchases#import')
    end
  end
end
