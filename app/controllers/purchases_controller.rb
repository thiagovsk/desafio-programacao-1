# frozen_string_literal: true

class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def import
    response = PurchaseServices::ImportFile.new.import_csv(params[:file])
    return redirect_to root_url, notice: 'Fail to import csv' unless response

    render :show, locals: { total_revenue: response }
  end
end
