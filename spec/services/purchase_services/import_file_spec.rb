# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchaseServices::ImportFile, type: :service do
  describe '.import_csv' do
    subject { described_class.new.import_csv(file_path) }
    describe 'valid csv' do
      let(:header) { "purchaser name\titem description\titem price\tpurchase count\tmerchant address\tmerchant name" }
      let(:row2) { "João Silva\tR$10 off R$20 of food\t10.0\t2\t987 Fake St\tBob's Pizza" }
      let(:rows) { [header, row2] }

      let(:file_path) { 'tmp/test.csv' }
      let!(:csv) do
        CSV.open(file_path, 'w', col_sep: "\t") do |csv|
          rows.each do |row|
            csv << row.split("\t")
          end
        end
      end

      it { is_expected.to be_truthy }
      it { is_expected.to eq(20) }
      after(:each) { File.delete(file_path) }
    end

    describe 'invalid csv' do
      subject { described_class.new.import_csv(file_path) }

      let(:file_path) { '' }
      it { is_expected.to be_falsey }
    end
  end
end
