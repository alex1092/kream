
class DashboardController < ApplicationController

  #Setting all products for the dashboard index controller
  def index
    @products = Product.all
  end
end
