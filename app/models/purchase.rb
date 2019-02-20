# frozen_string_literal: true

class Purchase < ApplicationRecord
  validates :purchaser_name, :item_description, :item_price, :purchase_count,
            :merchant_name, :merchant_name, presence: true
end
