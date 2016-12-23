class CustomersController < ApplicationController

  def index
    @customers = Customer.all
    render json: @customers, status: 200
  end


  def sideloaded
    render json: Customer.all, status: 200, each_serializer: SideloadCustomerSerializer
  end

  def alternate_sideloaded
    render json: Customer.alternate_sideload, status: 200
  end
end
