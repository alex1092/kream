class PagesController < ApplicationController
  before_action :set_products, only: [:show]

  def index
    @products = Product.all
    #Shuffling Products
    @shuffled_products = @products.shuffle
  end

  def admin
    # Setting products for the admin page/controller 
    @products = Product.all
  end

  def show; end

  def sneakers
    # Setting Sneakers
    @sneakers = Product.all
  end

  def apparel
    # Setting Apprel for the apparel page
    @apparel = Product.all
  end
end
