=begin
 Filename: app/controllers/customers.rb
 Directory: /Users/abruzzim/Documents/ga_wdi/projects/rocksolid/
 Author: Mario Abruzzi
 Date: 17-Jan-2014
 Desc: Project 1
 Notes: 
=end

class CustomersController < ApplicationController

  # GET /customers
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  def show
    @customer = Customer.find(params[:id])
  end

  # GET /customers/new
  def new
  end

  # POST /customers
  def create
    customer = Customer.new
    customer.name = params[:name]
    customer.addresses << Address.create({
                            street: params[:street],
                            city:   params[:city],
                            state:  params[:state],
                            zip:    params[:zip]
                            })
    customer.save
    redirect_to customers_path
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # PUT /customers/1
  def update
    customer = Customer.find(params[:id])
    customer.update_attributes(
      name: params[:name]
      )
    customer.addresses.first.update_attributes(
      street: params[:street],
      city:   params[:city],
      state:  params[:state],
      zip:    params[:zip]
      )
    redirect_to customers_path
  end

  # DELETE /customers/1
  def destroy
    customer = Customer.find(params[:id])
    customer.address_ids.each do |id|
      Address.find(id).destroy
    end
    customer.destroy
    redirect_to customers_path
  end

end
