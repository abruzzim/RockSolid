class CustomersController < ApplicationController
  # GET /customers
  def index
    # Get collection of objects.
    @customers = Customer.all
    # Call index.html.erb
  end
  # GET /customers/new
  def new
    # Why not Create a new object.
    # Call new.html.erb
  end
  # POST /customers
  def create
    # Create row from view parameters.
    Address.create({
      street:      params[:street],
      city:        params[:city],
      state:       params[:state],
      zip:         params[:zip],
      customer_id: Customer.create({
                    name: params[:name]
                   }).id
      })
    # Redirect to index.html.erb
    redirect_to customers_path
  end
  # GET /customers/1/edit
  def edit
    # Get selected object by id.
    c = Customer.find(params[:id])
    @cid    = c.id
    @name   = c.name
    @street = c.addresses.first.street
    @city   = c.addresses.first.city
    @state  = c.addresses.first.state
    @zip    = c.addresses.first.zip
    # Call edit.html.erb
  end
  # PUT /customers/1
  def update
    # Update row from template view parameters.
    c = Customer.find(params[:id])
    c.name                   = params[:name]
    c.addresses.first.update_attributes(street: params[:street])
    c.addresses.first.update_attributes(city: params[:city])
    c.addresses.first.update_attributes(state: params[:state])
    c.addresses.first.update_attributes(zip: params[:zip])
    # Call index.html.erb
    redirect_to customers_path
  end
  # DELETE /customers/1
  def destroy
    # Delete selected object by id.
    c = Customer.find(params[:id])
    c.address_ids.each do |id|
      Address.find(id).delete
    end
    c.delete
    # Call index.html.erb
    redirect_to customers_path
  end

end