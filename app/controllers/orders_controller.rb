=begin
 Filename: app/controllers/orders.rb
 Directory: /Users/abruzzim/Documents/ga_wdi/projects/rocksolid/
 Author: Mario Abruzzi
 Date: 17-Jan-2014
 Desc: Project 1
 Notes: 
=end

class OrdersController < ApplicationController

  # GET /orders/1
  def show
    #@order = Order.find(params[:id])
  end

  # GET /orders/new
  def new
  end

  # POST /orders
  def create
    order = Order.new
    order.order_num = params[:order_num]
    order.build_cargo.quantity = params[:quantity]
    order.cargo.build_rock({
      rtype:      params[:rtype],
      rgrade:     params[:rgrade],
      rform:      params[:rform],
      rthickness: params[:rthickness],
      unit_price: params[:unit_price]
      })
    order.build_customer.name = params[:name]
    order.customer.addresses << Address.create({
                                  street: params[:street],
                                  city:   params[:city],
                                  state:  params[:state], 
                                  zip:    params[:zip]
                                  }) 
    order.build_delivery.ship_date = params[:ship_date]
    order.delivery.build_address({
      street: params[:ship_street],
      city:   params[:ship_city],
      state:  params[:ship_state], 
      zip:    params[:ship_zip]
      })
    order.save
    redirect_to root_path
  end

  # GET /orders/1/edit
  def edit
    #@order = Order.find(params[:id])
  end

  # PUT /orders/1
  def update
    #@order = Order.find(params[:id])
    #@order.update_attributes(
    #  lic_plate: params[:lic_plate],
    #  capacity:  params[:capacity]
    #  )
    #redirect_to orders_path
  end

  # DELETE /orders/1
  def destroy
    #@order = Order.find(params[:id])
    #@order.destroy
    #redirect_to orders_path
  end
end
