# frozen_string_literal: true

require 'rails_helper'
require 'csv'
RSpec.describe PurchasesController, type: :controller do
  let(:valid_attributes) do
    FactoryBot.build(:purchase).attributes
  end

  let(:invalid_attributes) do
    {}
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Purchase.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #import' do
    context 'with valid params' do
      before do
        valid_row = FactoryBot.build(:purchase).attributes
        expect(CSV).to receive(:foreach).and_return([valid_row])
      end

      it 'create purchaes when csv is valid' do
        expect do
          post :import, params: { file: 'file' }, session: valid_session
        end.to change(Purchase, :count).by(1)
      end

      it 'returns a sucess response' do
        post :import, params: { file: 'file' }, session: valid_session
        expect(response).to be_successful
      end
    end

    context 'with invalid params' do
      it 'redirect to root_url' do
        post :import, params: { purchase: invalid_attributes }, session: valid_session
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
