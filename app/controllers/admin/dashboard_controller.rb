class Admin::DashboardController < ApplicationController
  def show
    @products = Product.count
  end
end
