class HomeController < ApplicationController

  # GET /
  def index
    @orders = Order.all
  end

  # GET /setup
  def setup
  end

end