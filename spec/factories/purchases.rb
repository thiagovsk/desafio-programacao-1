# frozen_string_literal: true

FactoryBot.define do
  factory :purchase do
    purchaser_name { 'foo' }
    item_description { 'bar' }
    item_price { 10.1 }
    purchase_count { 2 }
    merchant_address { ' fake address' }
    merchant_name { 'fake name' }
  end
end
