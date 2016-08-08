class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show 
    redirect_to index 
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(params)

    redirect_to customers_path
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    Customer.update(params[:id], params)

    redirect_to customer_path(params[:id])
  end

  def destroy
    Customer.destroy(params[:id])
    redirect_to customers_path
  end
end
