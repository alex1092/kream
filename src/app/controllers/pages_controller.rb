class PagesController < ApplicationController
  before_action :set_apparel, only: [:show]
  before_action :set_sneakers, only: [:show]
  before_action :set_shuffled_sneakers, only: [:show]
  before_action :set_shuffled_apparels, only: [:show]
  def index
    @sneakers = Sneaker.all
    @apparels = Apparel.all
    @shuffled_apparels = @apparels.shuffle
    @shuffled_sneakers = @sneakers.shuffle
  end

  def about
  end

  def contact
  end

  def show
 
  end
end
