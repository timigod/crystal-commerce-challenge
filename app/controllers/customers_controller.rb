class CustomersController < ApplicationController

  def index
    @customers = Customer.all
    render json: @customers, status: 200
  end


  def sideloaded
    render json: Customer.sideload, status: 200
  end
end
