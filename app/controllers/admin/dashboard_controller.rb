class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  def show
    @admin_username = ENV['ADMIN_USERNAME']
    @count_products = Product.count
    @count_categories = Category.count
  end
end
