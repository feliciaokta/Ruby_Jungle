class Admin::DashboardController < ApplicationController
  def show
    @products = Product.count,
    @categories = Product.categories
  end
end
