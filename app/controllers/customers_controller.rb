class CustomersController < ApplicationController

  def index
    # Get collection of objects.
    @customers = Customer.all
    # Call index template view.
  end

  def new
    # Call new template view.
  end

  def create
    # Create row from template view parameters.
    Address.create({
      street:      params[:street],
      city:        params[:city],
      state:       params[:state],
      zip:         params[:zip],
      customer_id: Customer.create({
                    name: params[:name]
                   }).id
      })
    # Call index template view.
    redirect_to customers_path
  end

  def edit
    # Get selected object by id.
    c = Customer.find(params[:id])
    @cid    = c.id
    @name   = c.name
    @street = c.addresses.first.street
    @city   = c.addresses.first.city
    @state  = c.addresses.first.state
    @zip    = c.addresses.first.zip
    # Call edit template view.
  end

  def update
    # Update row from template view parameters.
    c = Customer.find(params[:id])
    c.name                   = params[:name]
    c.addresses.first.street = params[:street]
    c.addresses.first.city   = params[:city]
    c.addresses.first.state  = params[:state]
    c.addresses.first.zip    = params[:zip]
    c.save
    # Call index template view.
    redirect_to customers_path
  end

  def destroy
    # Delete selected object by id.
    c = Customer.find(params[:id])
    c.address_ids.each do |id|
      Address.find(id).delete
    end
    c.delete
    # Call index template view.
    redirect_to customers_path
  end

end