class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def new
  end

  def create
    Address.create({
      street:      params[:street],
      city:        params[:city],
      state:       params[:state],
      zip:         params[:zip],
      customer_id: Customer.create({
                    name: params[:name]
                   }).id
      })
    redirect_to customers_path
  end

  def edit
    c = Customer.find(params[:id])
    @cid    = c.id
    @name   = c.name
    @street = c.addresses.first.street
    @city   = c.addresses.first.city
    @state  = c.addresses.first.state
    @zip    = c.addresses.first.zip
  end

  def update
    c = Customer.find(params[:id])
    c.name                   = params[:name]
    c.addresses.first.street = params[:street]
    c.addresses.first.city   = params[:city]
    c.addresses.first.state  = params[:state]
    c.addresses.first.zip    = params[:zip]
    c.save
    redirect_to customers_path
  end

  def destroy
    c = Customer.find(params[:id])
    c.address_ids.each do |id|
      Address.find(id).delete
    end
    c.delete
    redirect_to customers_path
  end

end