class PagesController < ApplicationController

  before_action :set_products, only: [:show]
  def index
    
    @products = Product.all
    @shuffled_products = @products.shuffle
  end

  def about
  end

  def contact
  end

  def show
 
  end
end
