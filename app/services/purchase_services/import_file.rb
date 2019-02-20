# frozen_string_literal: true

class PurchaseServices::ImportFile
  require 'csv'
  def import_csv(file)
    return false if file.blank?

    purchases = []
    ::CSV.foreach(file, col_sep: "\t", headers: true).each do |row|
      purchase = Purchase.create!(row.to_h.transform_keys { |key| key.to_s.tr(' ', '_') })
      purchases << purchase
    end
    total_revenue(purchases)
  end

  def total_revenue(purchases)
    purchases.sum { |purchase| purchase.item_price * purchase.purchase_count }
  end
end
