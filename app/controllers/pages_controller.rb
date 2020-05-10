class PagesController < ApplicationController
  before_action :set_apparel, only: [:show]
  before_action :set_sneakers, only: [:show]
  def index
    @sneakers = Sneaker.all
    @apparels = Apparel.all
  end

  def about
  end

  def contact
  end
end
